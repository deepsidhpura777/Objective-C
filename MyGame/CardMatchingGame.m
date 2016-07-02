//
//  CardMatchingGame.m
//  MyGame
//
//  Created by Deep Sidhpura on 3/15/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property(nonatomic,readwrite) NSInteger score;
@property(nonatomic,strong) NSMutableArray *cards;
@property(nonatomic)NSInteger countChosenCards;
@property(nonatomic,strong)NSMutableArray *chosenCards;

@end


@implementation CardMatchingGame

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

-(NSMutableString *)result{
    
    if(!_result) _result=[[NSMutableString alloc]init];
    
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


-(Card *)cardAtIndex:(NSUInteger)index{
    
    return (index<[self.cards count]) ? self.cards[index] : nil;
}


static const int MISMATCH_PENALTY =2;
static const int MATCH_BONUS =4;
static const int COST_TO_CHOOSE =1;


/*-(void)chooseCardAtIndex:(NSUInteger)index{
 
 Card *card=[self cardAtIndex:index];
 if(!card.matched){
 
 if(card.chosen){    //if the user didnt find a match then the 2nd card will still be chosen.Therefore when the user clicks on the chosen card again,its score wont be cut
 card.chosen=NO;
 }
 else{
 
 for (Card *otherCard in self.cards){
 
 if (otherCard.chosen && !otherCard.matched) { // for the first time the user picks the new card, it naturally wont enter this if coz no other card is previously chosen
 int matchScore=[card match:@[otherCard]];
 
 if (matchScore) {
 self.score+=matchScore*MATCH_BONUS;
 otherCard.matched=YES;
 card.matched=YES;
 }
 
 else{
 self.score-=MISMATCH_PENALTY;
 otherCard.chosen=NO;
 }
 break; //it only allows first occurence of a previously chosen card,ie only 2 cards.
 }
 }
 
 self.score-=COST_TO_CHOOSE;
 card.chosen=YES;
 }
 
 }
 
 
 }*/

-(void)chooseCardAtIndex:(NSUInteger)index :(int) n{
    
    
    Card *card=[self cardAtIndex:index];
    if(!card.matched){
        
        if(!card.chosen){
            self.countChosenCards++;
        }
        
        
        if (flag==1){
            NSString* temp=[self.result substringWithRange:NSMakeRange(prevlength, length)];
            [self.result setString:temp];
        }
        if (flag==2) {
            [self.result setString:@" "];
            flag=0;
        }
        
        
        if(card.chosen){    //if the user didnt find a match then the 2nd card will still be chosen.Therefore when the user clicks on the chosen card again,its score wont be cut
            card.chosen=NO;
            self.countChosenCards--;
            NSRange range=[self.result rangeOfString:card.contents];
            [self.result deleteCharactersInRange:range];
            //[self.result setString:@" "];
            flag=0;
        }
        
        else{
            
            if(self.countChosenCards==n){
                for (Card *otherCard in self.cards){
                    
                    if (otherCard.chosen && !otherCard.matched) {
                        
                        [self.chosenCards addObject:otherCard];
                    }
                }
            }
            
            if([self.chosenCards count]!=0){
                int matchScore=[card match:self.chosenCards];
                if (matchScore) {
                    self.score+=matchScore*MATCH_BONUS;
                    for (Card *otherCard in self.chosenCards) {
                        otherCard.matched=YES;
                    }
                    card.matched=YES;
                    self.countChosenCards=0;
                    [self.result appendString:card.contents];
                    
                    [self.result appendString:@"Yup it matched!!"];
                    
                    NSMutableString *newString=[[NSMutableString alloc]initWithString:self.result];
//Each and every object added in a Mutable array must be a new pointer reference.Therefore necessary to make a new String to add.
                    [self.slidingResultHistory insertObject:newString atIndex:self.slidingCount];
                    self.slidingCount++;
                   
                    
                  
                    
                    [self.chosenCards removeAllObjects];
                    flag=2;
                }
                
                else{
                    self.score-=MISMATCH_PENALTY;
                    for (Card *otherCard in self.chosenCards) {
                        otherCard.chosen=NO;
                        self.countChosenCards--;
                    }
                    prevlength=[self.result length];
                    [self.result appendString:card.contents];
                    length=[card.contents length];
                    [self.result appendString:@"You get a Penalty!!"];
                    
                  NSMutableString *newString1=[[NSMutableString alloc]initWithString:self.result];
                    
                    [self.slidingResultHistory insertObject:newString1 atIndex:self.slidingCount];
                    self.slidingCount++;
                
                 
                    
                    [self.chosenCards removeAllObjects];
                    flag=1;
                }
            }
            
            else{
                [self.result appendString:card.contents];
                flag=0;
            }
            
         
            self.score-=COST_TO_CHOOSE;
            card.chosen=YES;
            
        }
        
    }
    
    
}



@end
