//
//  ViewController.m
//  MyGame
//
//  Created by Deep Sidhpura on 3/15/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface ViewController ()

@property (nonatomic) int index;
@property (nonatomic) Deck* d;
@property(strong,nonatomic) CardMatchingGame *game;


@property (strong, nonatomic) IBOutlet UILabel *score;

@property (strong, nonatomic) IBOutlet UILabel *resultMessage;

- (IBAction)dealPress:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (strong, nonatomic) IBOutlet UISegmentedControl *gameSegment;

- (IBAction)controlSegment:(id)sender;


- (IBAction)touchButton:(id)sender;

@property (weak, nonatomic) IBOutlet UISlider *slider;
- (IBAction)sliding:(id)sender;


@end

@implementation ViewController


-(Deck *) d{
    
    if(!_d){
        
        _d=[[PlayingCardDeck alloc]init];
        
    }
    return _d;
}

-(CardMatchingGame *)game{
    
    if(!_game) _game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.d];
    
    return _game;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dealPress:(id)sender {
    self.d=[[PlayingCardDeck alloc]init];
    self.game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.d];
    [self updateUI];
    [self.gameSegment setEnabled:YES forSegmentAtIndex:abs(self.index-3)];
    self.resultMessage.text=@"Result:";
    [self.slider setValue:0 animated:YES];
    
}

- (IBAction)controlSegment:(id)sender {
    
    self.index=[sender selectedSegmentIndex]+2;
    NSLog(@"Selected index:%d",self.index);
}

- (IBAction)touchButton:(id)sender {
    
    
    int chosenButtonIndex=[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex:self.index];
    [self updateUI];
    [self.gameSegment setEnabled:NO forSegmentAtIndex:abs(self.index-3)];
    self.resultMessage.text=[NSString stringWithFormat:@"Result: %@",self.game.result];
    
    if(self.game.slidingCount){
        // [self.slider setMaximumValue:self.game.slidingCount];
         [self.slider setValue:self.game.slidingCount animated:NO];
        
       }
}


-(void) updateUI{
    
    for(UIButton *cardButton in self.cardButtons){
        
        int cardButtonIndex=[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.matched;
        self.score.text=[NSString stringWithFormat:@"Score: %d",self.game.score];
        
    }
}

-(NSString *)titleForCard:(Card *)card{
    
    return card.chosen ? card.contents:@"";
}

-(UIImage*)backgroundImageForCard:(Card *)card{
    
    return [UIImage imageNamed:card.chosen ? @"cardFront":@"cardBack"];
}


- (IBAction)sliding:(id)sender {
    int v=self.slider.value;
    
    if (v==0) {
        self.resultMessage.text=@"Match Begins";
    }
    else if(v<=self.game.slidingCount){
        self.resultMessage.text=[self.game.slidingResultHistory objectAtIndex:v-1];
    }
    else
        self.resultMessage.text=@"Match yet to be made";
}
@end
