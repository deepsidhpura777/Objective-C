//
//  SetPlayingCard.h
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 5/7/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"

@interface SetPlayingCard : Card

@property(nonatomic) NSUInteger rank;
@property(nonatomic) NSString* shape;
@property (nonatomic) NSString* shading;
@property(nonatomic) NSString * color;

+(NSInteger) maxRank;
+(NSArray *) validShapes;
+(NSArray*) validColors;
+(NSArray *) valisShading;


@end
