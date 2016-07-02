//
//  SetGameViewController.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 4/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "SetGameViewController.h"
#import "Deck.h"
#import "SetPlayingCardDeck.h"
#import "SetPlayingCard.h"
#import "SetCardMatchingGame.h"
#import "SetPlayingCardView.h"
#import "Grid.h"
#include "HistoryViewController.h"

@interface SetGameViewController ()
@property (nonatomic)Deck* deck;
@property (weak, nonatomic) IBOutlet UIView *gridView;
@property (strong,nonatomic) NSMutableArray *cardViews;
@property (strong, nonatomic) IBOutlet UILabel *score;
- (IBAction)dealPress:(id)sender;
@property int cardsEnabled;

@property(nonatomic)Grid *grid;

@property(nonatomic)SetCardMatchingGame* game;


@end



@implementation SetGameViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"setgame"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *h=(HistoryViewController*)segue.destinationViewController;
            h.textHistory=self.game.slidingResultHistory;
            h.game=3;
        }
        
    }
}

- (NSMutableArray *)cardViews
{
    if (!_cardViews) _cardViews = [NSMutableArray arrayWithCapacity:self.numberOfStartingCards];
    return _cardViews;
}


- (Grid *)grid
{
    if (!_grid) {
        _grid = [[Grid alloc] init];
        _grid.cellAspectRatio = self.maxCardSize.width / self.maxCardSize.height;
        _grid.minimumNumberOfCells = self.numberOfStartingCards;
        _grid.maxCellWidth = self.maxCardSize.width;
        _grid.maxCellHeight = self.maxCardSize.height;
        _grid.size = self.gridView.frame.size;
    }
    return _grid;
}

-(void) addGestures{
    for (SetPlayingCardView* cardview  in self.cardViews) {
        // cardview.faceUp=YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [singleTap setNumberOfTapsRequired:1];
        [singleTap setNumberOfTouchesRequired:1];
        [cardview addGestureRecognizer:singleTap];
    }
    
}


-(Deck *) deck{
    if (!_deck) _deck=[[SetPlayingCardDeck alloc]init];
    
    return _deck;

}

-(SetCardMatchingGame*)game{
    if(!_game) _game=[[SetCardMatchingGame alloc] initWithCardCount:[self.cardViews count] usingDeck:self.deck];
    
    return _game;
}

#define CARDSPACINGINPERCENT 0.08

-(void) createView{
    for (NSUInteger cardIndex = 0;cardIndex < 12;cardIndex++){
        
        SetPlayingCardView *cardView=[[SetPlayingCardView alloc]init]; //This will be CardGameView for my class or else typecast.
        cardView.frame = CGRectMake(self.gridView.bounds.size.width,self.gridView.bounds.size.height,self.grid.cellSize.width,self.grid.cellSize.height);
        [self.cardViews addObject:cardView];     // for the sake of animations, initially the cards' frames are set at the bottom outside the main grid view.
        [self.gridView addSubview:cardView];
        cardView.backgroundColor=self.gridView.backgroundColor;
    }
    
    self.grid.minimumNumberOfCells = [self.cardViews count];
    
    NSUInteger changedViews = 0;
    for (NSUInteger viewIndex = 0; viewIndex < [self.cardViews count]; viewIndex++) {
        CGRect frame = [self.grid frameOfCellAtRow:viewIndex / self.grid.columnCount     // we get the frame of the grid drawn in the grid class
                                          inColumn:viewIndex % self.grid.columnCount];
        frame = CGRectInset(frame, frame.size.width * CARDSPACINGINPERCENT, frame.size.height * CARDSPACINGINPERCENT);  // we now inset to get the main final frame inside that grid frame and then set this new frame in the animation to our cardview so that it seems moving from the bottom
        UIView *cardView = (UIView *)self.cardViews[viewIndex];
        if (![self frame:frame equalToFrame:cardView.frame]) {  //Checking whether the frame returned is of the same size as the original frame.
            [UIView animateWithDuration:0.5
                                  delay:1.5 * changedViews++ / [self.cardViews count]
                                options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 cardView.frame = frame;
                             } completion:NULL];
        }
        cardView.frame=frame;
        //cardView.backgroundColor=[UIColor redColor];
    }
}

#define FRAMEROUNDINGERROR 0.01

- (BOOL)frame:(CGRect)frame1 equalToFrame:(CGRect)frame2
{
    if (fabs(frame1.size.width - frame2.size.width) > FRAMEROUNDINGERROR) return NO;
    if (fabs(frame1.size.height - frame2.size.height) > FRAMEROUNDINGERROR) return NO;
    if (fabs(frame1.origin.x - frame2.origin.x) > FRAMEROUNDINGERROR) return NO;
    if (fabs(frame1.origin.y - frame2.origin.y) > FRAMEROUNDINGERROR) return NO;
    return YES;
}

-(void)tap:(UITapGestureRecognizer *) gesture{
    
    SetPlayingCardView *  myView=(SetPlayingCardView *)gesture.view;
    //myView.alpha=0.5;
    [self.game chooseCardAtIndex:gesture.view.tag:3];
    NSLog(@"Tap Tag:%ld",(long)gesture.view.tag);
    
    [SetPlayingCardView transitionWithView:myView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        myView.faceUp=!myView.faceUp;
    } completion:nil];
    // myView.faceUp=!myView.faceUp;
    [self updateUI];
    
    
}







- (IBAction)dealPress:(id)sender {
    
    
   NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSMutableString *obj=[[NSMutableString alloc]init];
    NSMutableString *key=[[NSMutableString alloc]init];
    obj=[NSMutableString stringWithFormat:@"%ld %@",(long)self.game.score,@"3 card game"];
    key=[NSMutableString stringWithFormat:@"%ld",(long)self.game.score];
    // [self.defaults setInteger:self.game.score forKey:temp];
    [defaults setObject:obj forKey:key];
    [defaults synchronize];
    
    
    for (UIView *subView in self.cardViews) {
        [UIView animateWithDuration:0.5
                         animations:^{
                             subView.frame = CGRectMake(0.0,
                                                        self.gridView.bounds.size.height,
                                                        self.grid.cellSize.width,          // shifting the card view frame again out of the main grid view frame with animation and then removing from the grid view.
                                                        self.grid.cellSize.height);
                         } completion:^(BOOL finished) {
                             [subView removeFromSuperview];
                         }];
    }
    self.cardViews = nil;
    self.grid = nil;
    
    
    
    [self createView];
    self.deck=[[SetPlayingCardDeck alloc]init];
    self.game=[[SetCardMatchingGame alloc] initWithCardCount:[self.cardViews count] usingDeck:self.deck];
    
    [self addGestures];
    [self updateUI];
}



-(void)updateUI{
    
    self.cardsEnabled=0;
    for(SetPlayingCardView *cardView in self.cardViews){
        
        int cardButtonIndex=(int)[self.cardViews indexOfObject:cardView];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        SetPlayingCard *mycard=(SetPlayingCard *) card;
        cardView.rank=mycard.rank;
        cardView.shape=mycard.shape;
        cardView.color=mycard.color;
        cardView.shading=mycard.shading;
        cardView.tag=cardButtonIndex;
        
        
       // [cardButton setAttributedTitle:[self.game title:mycard] forState:UIControlStateNormal];
        //[cardButton setBackgroundImage:[UIImage imageNamed:@"cardFront"] forState:UIControlStateNormal];
       // cardButton.showsTouchWhenHighlighted=[self getStatus:card];
        
        cardView.enabled=!card.matched;
        if (cardView.enabled==NO) {
            cardView.alpha=0.5;
        }
        self.score.text=[NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
       
    
}
    
}


-(BOOL) getStatus:(Card *) card{
    
    return card.chosen ? YES : NO ;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberOfStartingCards = 12;
    self.maxCardSize = CGSizeMake(80.0, 120.0);
    [self createView];
    [self updateUI];
    [self addGestures];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


    
    

@end
