//
//  SetCardMatchingGame.h
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 5/10/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
#import "SetPlayingCard.h"

@interface SetCardMatchingGame : NSObject{
    
    int flag;
    int length,prevlength;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

-(void) chooseCardAtIndex:(NSUInteger)index :(int) n;
-(Card *) cardAtIndex:(NSUInteger)index;

@property(nonatomic,readonly)NSInteger score;
@property(nonatomic)NSMutableAttributedString* result;
@property(nonatomic,strong) NSMutableArray *slidingResultHistory;
@property(nonatomic) int slidingCount;

//-(NSAttributedString*)title:(SetPlayingCard *) card;

@end
