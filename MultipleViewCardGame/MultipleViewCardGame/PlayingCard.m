//
//  PlayingCard.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 4/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "PlayingCard.h"



@implementation PlayingCard

-(NSString *)contents{
    
    NSArray *rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit=_suit;

+(NSArray*) validSuits{
    
    return @[@"♥",@"♦",@"♠",@"♣"];
}

-(void) setSuit:(NSString *)suit{
    
    if([[PlayingCard validSuits] containsObject:suit]){
        
        _suit=suit;
    }
}

-(int)match:(NSArray *)otherCards{
    
    int score=0;
    if ([otherCards count]==1) {
        PlayingCard *otherCard=[otherCards firstObject];
        if(otherCard.rank==self.rank){
            score=8;
        }
        else if ([otherCard.suit isEqualToString:self.suit]){
            
            score=4;
        }
        
        
    }
    if ([otherCards count]==2) {
        PlayingCard *card1=[otherCards firstObject];
        PlayingCard *card2=[otherCards lastObject];
        if(card1.rank==self.rank || card2.rank==self.rank || card2.rank==card1.rank){
            score=16;
        }
        else if(card1.suit==self.suit || card2.suit==self.suit || card2.suit==card1.suit){
            score=8;
        }
        
    }
    return score;
}



+(NSArray *)rankStrings{
    
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger) maxRank{
    
    return [[self rankStrings] count]-1;
}

-(void) setRank:(NSUInteger)rank{
    
    if(rank <= [PlayingCard maxRank]){
        
        _rank=rank;
    }
}

-(NSString *)suit{
    
    return _suit ? _suit : @"?";
}

@end
