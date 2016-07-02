//
//  Card.h
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 4/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject


@property (strong,nonatomic) NSString *contents;

@property(nonatomic) BOOL chosen;

@property(nonatomic) BOOL matched;

-(int) match:(NSArray *)otherCards;

@end
