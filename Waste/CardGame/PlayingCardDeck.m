//
//  PlayingCardDeck.m
//  CardGame
//
//  Created by Deep Sidhpura on 2/16/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype) init{
    
    self=[super init];
    
    if(self){
        
        for (NSString *suit in [PlayingCard validSuits]) {
            for(NSUInteger r=1; r<=[PlayingCard maxRank];r++){
                PlayingCard *card=[[PlayingCard alloc]init];
                
                card.rank=r;
                card.suit=suit;
                [self addCard:card];
            }
        }
    }
    return self;
}



@end
