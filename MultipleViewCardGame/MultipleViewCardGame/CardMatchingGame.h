//
//  CardMatchingGame.h
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 4/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject{
    
    int flag;
    int length,prevlength;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void) chooseCardAtIndex:(NSUInteger)index :(int) n;
-(Card *) cardAtIndex:(NSUInteger)index;

@property(nonatomic,readonly)NSInteger score;
@property(nonatomic,strong)NSMutableString* result;
@property(nonatomic,strong) NSMutableArray *slidingResultHistory;
@property(nonatomic) int slidingCount;
@end