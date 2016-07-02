//
//  SetCardMatchingGame.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 5/10/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "SetCardMatchingGame.h"

@interface  SetCardMatchingGame()

@property(nonatomic,readwrite) NSInteger score;
@property(nonatomic,strong) NSMutableArray *cards;
@property(nonatomic)NSInteger countChosenCards;
@property(nonatomic,strong)NSMutableArray *chosenCards;

@end

@implementation SetCardMatchingGame

-(NSMutableArray*) cards{
    
    if(!_cards) _cards=[[NSMutableArray alloc]init];
    
    return _cards;
}

-(NSMutableArray *)slidingResultHistory{
    if(!_slidingResultHistory) {
        _slidingResultHistory=[[NSMutableArray alloc]init];
        NSLog(@"Entered");
    }
    
    return _slidingResultHistory;
}

-(NSMutableArray*) chosenCards{
    
    if(!_chosenCards) _chosenCards=[[NSMutableArray alloc]init];
    
    return _chosenCards;
}

-(NSMutableAttributedString *)result{
    
    if(!_result) _result=[[NSMutableAttributedString alloc]init];
    
    return _result;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{ // will be used to initialize the CardMatchingGame classes' object so that the cards are assigned randomly
    
    self=[super init];
    
    if(self){  //We are filling up our card game array with random cards drawn from  the deck
        
        for (int i=0; i<count; i++) {
            
            Card *card=[deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }
            else{
                self=nil;
                break;
            }
        }
    }
    return self;
    
}

-(void)chooseCardAtIndex:(NSUInteger)index :(int) n{
    
    
    Card *card=[self cardAtIndex:index];
    if (card) {
        
    
   // SetPlayingCard *mycard=(SetPlayingCard *)card;
    
    if(!card.matched){
        
        if(!card.chosen){
            self.countChosenCards++;
        }
        
        
        
        
        if(card.chosen){    //if the user didnt find a match then the 2nd card will still be chosen.Therefore when the user clicks on the chosen card again,its score wont be cut
            card.chosen=NO;
            self.countChosenCards--;
            
        }
        
        else{
            
            if(self.countChosenCards==n){
                
                for (Card *otherCard in self.cards){
                    
                    if (otherCard.chosen && !otherCard.matched) {
                        
                //        SetPlayingCard *tempcard=(SetPlayingCard*)otherCard;
                        [self.chosenCards addObject:otherCard];
                       // [self.result appendAttributedString:[self title:tempcard]];
                        
                        
                    }
                }
                //[self.result appendAttributedString:[self title:mycard]];
            }
            
            if([self.chosenCards count]!=0){
                int matchScore=[card match:self.chosenCards];
                if (matchScore) {
                    self.score+=matchScore;
                    for (Card *otherCard in self.chosenCards) {
                        otherCard.matched=YES;
                    }
                    card.matched=YES;
                    self.countChosenCards=0;
                   
                    
                    [self.result appendAttributedString:[[NSAttributedString alloc]initWithString:@"Yup it matched!!"]];
                    
                    NSMutableAttributedString *newString=[[NSMutableAttributedString alloc]initWithAttributedString:self.result];
                    //Each and every object added in a Mutable array must be a new pointer reference.Therefore necessary to make a new String to add.
                    [self.slidingResultHistory insertObject:newString atIndex:self.slidingCount];
                    self.slidingCount++;
                    
                    
                    
                    
                    [self.chosenCards removeAllObjects];
                    [self.result setAttributedString:[[NSAttributedString alloc]initWithString:@" "]];
                    
                }
                
                else{
                    self.score-=4;
                    for (Card *otherCard in self.chosenCards) {
                        otherCard.chosen=NO;
                        self.countChosenCards--;
                    }
                    
                    [self.result appendAttributedString:[[NSAttributedString alloc]initWithString: @"You get a Penalty!!"]];
                    
                    NSMutableAttributedString *newString1=[[NSMutableAttributedString alloc]initWithAttributedString:self.result];
                    
                    [self.slidingResultHistory insertObject:newString1 atIndex:self.slidingCount];
                    self.slidingCount++;
                    
                    
                    
                    [self.chosenCards removeAllObjects];
                    [self.result setAttributedString:[[NSAttributedString alloc]initWithString:@" "]];
                    
                }
            }
          
            
            
            self.score-=1;
            card.chosen=YES;
            
        }
        
    }
    
    }
    else
        NSLog(@"Card is empty");
}

/*-(NSAttributedString*)title:(SetPlayingCard *) card{
    
    NSMutableDictionary *attributes=[[NSMutableDictionary alloc]init];
    NSString* symbol=[[NSString alloc]init];
    
    if ([card.shape isEqualToString:@"diamond"]) {
        symbol=@"■";
    }
    
    if ([card.shape isEqualToString:@"oval"]) {
        symbol=@"●";
    }
    
    if ([card.shape isEqualToString:@"triangle"]) {
        symbol=@"▲";
    }
    
    if ([card.color isEqualToString:@"redColor"]) {
        [attributes setObject:[UIColor redColor]   forKey:NSForegroundColorAttributeName];
        
    }
    if ([card.color isEqualToString:@"blueColor"]) {
        [attributes setObject:[UIColor blueColor]   forKey:NSForegroundColorAttributeName];
        
    }
    if ([card.color isEqualToString:@"orangeColor"]) {
        [attributes setObject:[UIColor orangeColor]   forKey:NSForegroundColorAttributeName];
        
    }
    
    if([card.shading isEqualToString:@"fill"]){
        [attributes setObject:@-5 forKey:NSStrokeWidthAttributeName];
    }
    if([card.shading isEqualToString:@"stroke"]){
        [attributes addEntriesFromDictionary:@{NSStrokeWidthAttributeName: @-5,NSStrokeColorAttributeName:attributes[NSForegroundColorAttributeName],NSForegroundColorAttributeName:[UIColor blackColor]}];
    }
    if ([card.shading isEqualToString:@"outline"]) {
        [attributes setObject:@5 forKey:NSStrokeWidthAttributeName];
    }
    
    return [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%lu %@",(unsigned long)card.rank,symbol] attributes:attributes];
}*/


-(Card *)cardAtIndex:(NSUInteger)index{
    
    return (index<[self.cards count]) ? self.cards[index] : nil;
}

@end
