//
//  SetPlayingCard.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 5/7/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "SetPlayingCard.h"



@implementation SetPlayingCard

@synthesize shape=_shape;

-(NSString*)contents{
    
    return [NSString stringWithFormat:@"%lu:%@:%@:%@:",(unsigned long)self.rank,self.shape,self.shading,self.color];
}

-(int)match:(NSArray *)otherCards{
    
    SetPlayingCard *card1=[otherCards firstObject];
    SetPlayingCard *card2=[otherCards lastObject];
    int flag1=0,flag2=0,flag3=0,flag4=0,score=0;
    
    if ((self.rank==card1.rank && card1.rank==card2.rank) || (self.rank!=card1.rank && card1.rank!=card2.rank && self.rank!=card2.rank)) {
        flag1=1;
    }
    else
        flag1=0;
    
    if ((self.color==card1.color && card1.color==card2.color) || (self.color!=card1.color && card1.color!=card2.color && self.color!=card2.color)) {
        flag2=1;
    }
    else
        flag2=0;
    
    
    if ((self.shape==card1.shape && card1.shape==card2.shape) || (self.shape!=card1.shape && card1.shape!=card2.shape && self.shape != card2.shape)) {
        flag3=1;
    }
    else
        flag3=0;
    
    
    if ((self.shading==card1.shading && card1.shading==card2.shading) || (self.shading!=card1.shading && card1.shading!=card2.shading && self.shading!=card2.shading)) {
        flag4=1;
    }
    else
        flag4=0;
    
    if(flag1==1 && flag2==1 && flag3==1 && flag4==1)
    score=20;
    else
        score=0;
    
    NSLog(@"Rank:%d Color:%d Shape:%d Shading:%d",flag1,flag2,flag3,flag4);
    NSLog(@"Card 1:%@",card1.contents);
    NSLog(@"Card 2:%@",card2.contents);
    NSLog(@"Card 3:%@",self.contents);
    
    return  score;

}





+(NSArray*) validColors{
    
    return @[@"red",@"green",@"purple"];
    
}
+(NSArray *) valisShading{
    
    return @[@"fill",@"stroke",@"outline"];
    
}


+(NSArray *)validShapes{
    
    
     return  @[@"oval",@"diamond",@"squiggle"];
}

+(NSInteger)maxRank{
    
    return [[self ranks] count]-1;
}

+(NSArray *)ranks{
    
    return @[@"?",@"1",@"2",@"3"];
}

-(void) setRank:(NSUInteger)rank{
    
    if(self.rank <= [SetPlayingCard maxRank]){
        
        _rank=rank;
    }
}

-(void) setShape:(NSString *)shape{
    if([[SetPlayingCard validShapes] containsObject:shape])
        _shape=shape;
    
}

-(NSString *)shape{
    
    return _shape  ? _shape : @"?";
}



@end
