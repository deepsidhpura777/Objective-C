//
//  Deck.h
//  MyGame
//
//  Created by Deep Sidhpura on 3/15/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject


-(void) addCard:(Card *) card atTop:(BOOL)atTop;

-(void) addCard:(Card *) card;

-(Card *) drawRandomCard;

@end
