//
//  SetPlayingCardDeck.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 5/9/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "SetPlayingCardDeck.h"

@implementation SetPlayingCardDeck


-(instancetype) init{
    
    self=[super init];
    
    if(self){
       
            for(NSUInteger r=1; r<=[SetPlayingCard maxRank];r++){
    
                for (NSString *shape in [SetPlayingCard validShapes]) {
                    for (NSString* shading in [SetPlayingCard valisShading]) {
                        for (NSString* color in [SetPlayingCard validColors]) {
                            
                            SetPlayingCard *card=[[SetPlayingCard alloc]init];
                            card.rank=r;
                            card.shape=shape;
                            card.color=color;
                            card.shading=shading;
                            
                            [self addCard:card];
                   
                        }
                    }
                }
            }
    }
    return self;
}



@end
