//
//  Card.m
//  MyGame
//
//  Created by Deep Sidhpura on 3/15/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "Card.h"

@implementation Card


-(int) match:(NSArray *)otherCards{
    
    int score=0;
    
    for(Card *card in otherCards){
        
        if([card.contents isEqualToString:self.contents]){
            
            score=1;
        }
    }
    
    return score;
}

@end
