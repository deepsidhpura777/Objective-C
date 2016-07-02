//
//  ViewController.m
//  CardGame
//
//  Created by Deep Sidhpura on 2/14/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (nonatomic) int index;
@property (nonatomic) Deck* d;
@property(strong,nonatomic) CardMatchingGame *game;
- (IBAction)controlSegment:(id)sender;
- (IBAction)dealPress:(id)sender;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gameSegment;
@property (strong, nonatomic) IBOutlet UILabel *resultMessage;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
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



- (IBAction)controlSegment:(id)sender {
    
    self.index=[sender selectedSegmentIndex]+2;
    NSLog(@"Selected index:%d",self.index);
}

- (IBAction)dealPress:(id)sender {
    self.d=[[PlayingCardDeck alloc]init];
    self.game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.d];
    [self updateUI];
    [self.gameSegment setEnabled:YES forSegmentAtIndex:abs(self.index-3)];
    self.resultMessage.text=@"Result:";
}




/*-(void) setFlipCount:(int)flipCount{
    
    _flipCount=flipCount;
    self.flipsLabel.text=[NSString stringWithFormat:@"Flips:%d",self.flipCount];
}*/

- (IBAction)touchButton:(UIButton *)sender {
    
  /*  if([sender.currentTitle length] ){
    
    UIImage *cardImage=[UIImage imageNamed:@"cardBack"];
    [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else{
        
        
        UIImage *cardImage=[UIImage imageNamed:@"cardFront"];
        [sender setBackgroundImage:cardImage forState:UIControlStateNormal];
        
        [sender setTitle:[self.d drawRandomCard].contents forState:UIControlStateNormal];
    }  
   Part of the earlier assignment.
   */
    
    int chosenButtonIndex=[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex:self.index];
    [self updateUI];
    [self.gameSegment setEnabled:NO forSegmentAtIndex:abs(self.index-3)];
    self.resultMessage.text=[NSString stringWithFormat:@"Result: %@",self.game.result];
   // self.flipCount++;

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
    NSLog(@"Score:%d",self.game.score);
}

-(NSString *)titleForCard:(Card *)card{
    
    return card.chosen ? card.contents:@"";
}

-(UIImage*)backgroundImageForCard:(Card *)card{
    
    return [UIImage imageNamed:card.chosen ? @"cardFront":@"cardBack"];
}

@end
