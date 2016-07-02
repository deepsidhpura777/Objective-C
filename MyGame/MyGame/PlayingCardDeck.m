//
//  PlayingCardDeck.m
//  MyGame
//
//  Created by Deep Sidhpura on 3/15/14.
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
