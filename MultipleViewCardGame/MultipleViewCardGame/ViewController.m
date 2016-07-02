//
//  ViewController.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 4/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"       // Transition animations are done by shifting the frame coordinates in the super view by shifting them in the animation block
#import "HistoryViewController.h"
#import "CardGameView.h"
#import "Grid.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UILabel *score;
- (IBAction)dealPress:(id)sender;
@property (strong,nonatomic) NSMutableArray *cardViews;
@property (weak, nonatomic) IBOutlet UIView *gridView;

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender;

@property (nonatomic) Deck* d;
@property(strong,nonatomic) CardMatchingGame *game;
@property int cardsEnabled;

@property(nonatomic)Grid *grid;

@end

@implementation ViewController

static int flag=0;
static int ctr=0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberOfStartingCards = 12;
    self.maxCardSize = CGSizeMake(80.0, 120.0);
    [self createView];
    [self updateUI];
    [self addGestures];
  
}

-(void) addGestures{
    for (CardGameView* cardview  in self.cardViews) {
        // cardview.faceUp=YES;
        NSLog(@"Card Rank:%lu Card Suit:%@ Card Tag:%ld",(unsigned long)cardview.rank,cardview.suit,(long)cardview.tag);
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [singleTap setNumberOfTapsRequired:1];
        [singleTap setNumberOfTouchesRequired:1];
        [cardview addGestureRecognizer:singleTap];
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

#define CARDSPACINGINPERCENT 0.08

-(void) createView{
    for (NSUInteger cardIndex = 0;cardIndex < 12;cardIndex++){
        
        CardGameView *cardView=[[CardGameView alloc]init]; //This will be CardGameView for my class or else typecast.
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"cardgame"]) {
        if ([segue.destinationViewController isKindOfClass:[HistoryViewController class]]) {
            HistoryViewController *h=(HistoryViewController*)segue.destinationViewController;
            h.textHistory=self.game.slidingResultHistory;
            h.game=2;
        }
        
    }
}

-(void)tap:(UITapGestureRecognizer *) gesture{
    
    CardGameView *  myView=(CardGameView *)gesture.view;
    [self.game chooseCardAtIndex:gesture.view.tag:2];
    NSLog(@"Tap Tag:%ld",(long)gesture.view.tag);
    
    [CardGameView transitionWithView:myView duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        myView.faceUp=!myView.faceUp;
    } completion:nil];
   // myView.faceUp=!myView.faceUp;
    [self updateUI];
    [self showMessage];
    
}


- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    
 
    
    
}

-(Deck *) d{
    
    if(!_d){
        
        _d=[[PlayingCardDeck alloc]init];
        
    }
    return _d;
}

-(CardMatchingGame *)game{
    
    if(!_game) _game=[[CardMatchingGame alloc] initWithCardCount:[self.cardViews count] usingDeck:self.d];
    
    return _game;
}




- (IBAction)dealPress:(id)sender {
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSMutableString *obj=[[NSMutableString alloc]init];
     NSMutableString *key=[[NSMutableString alloc]init];
    obj=[NSMutableString stringWithFormat:@"%ld %@",(long)self.game.score,@"2 card game"];
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
    self.d=[[PlayingCardDeck alloc]init];
    self.game=[[CardMatchingGame alloc] initWithCardCount:[self.cardViews count] usingDeck:self.d];
    [self updateUI];
    [self addGestures];
    flag=0;
    ctr=0;
}



-(void) updateUI{
    
    self.cardsEnabled=0;
    
    for(CardGameView *cardView in self.cardViews){
        
        int cardButtonIndex=(int)[self.cardViews indexOfObject:cardView];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        PlayingCard *mycard=(PlayingCard *)card;
        cardView.rank=mycard.rank;
        cardView.suit=mycard.suit;
        cardView.tag=cardButtonIndex;
        if (card.chosen==NO) {
            cardView.faceUp=NO;
        }
        
        //NSLog(@"Cards Tag:%ld",(long)cardView.tag);
        cardView.enabled=!card.matched;
        if (cardView.enabled==NO) {
            cardView.alpha=0.5;
        }
        if (card.matched==YES) {
            self.cardsEnabled++;
           
        }
       
    }
    //NSLog(@"Flag:%d",flag);
    
    if(flag==0){
      //  NSLog(@"In flag");
        if(ctr!=2){
            if(self.cardsEnabled==10){
            flag=0;
            ctr++;
            self.cardsEnabled--;
        }
        if(ctr==2)
            flag=1;
    }
    }
    
    
   // NSLog(@"Cards Enabled:%d",self.cardsEnabled);
    self.score.text=[NSString stringWithFormat:@"Score: %ld",(long)self.game.score];

}


-(void) showMessage{
    
    if (self.cardsEnabled==12 || self.cardsEnabled==10) {
        NSLog(@"In show Message");
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Game Over" message:@"Your Game has ended.Press Deal to replay." delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil];
        
        [alert show];
    }
    
}



@end
