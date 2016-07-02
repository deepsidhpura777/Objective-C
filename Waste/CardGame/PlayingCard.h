//
//  PlayingCard.h
//  CardGame
//
//  Created by Deep Sidhpura on 2/16/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property(strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray*) validSuits;
+(NSUInteger) maxRank;

@end
