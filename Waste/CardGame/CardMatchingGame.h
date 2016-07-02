//
//  CardMatchingGame.h
//  CardGame
//
//  Created by Deep Sidhpura on 3/7/14.
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

@end
