//
//  Nums.m
//  Polymorphism
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import "Nums.h"

@implementation Nums

-(void) setNums:(int)a :(int)b{
    
    num1=a;
    num2=b;
}

-(void) add{
    
    ans=num1+num2;
    
}

-(void) print{

    NSLog(@"The addition of the nos is:%i",ans);
}

@end
