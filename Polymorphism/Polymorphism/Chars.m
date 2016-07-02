//
//  Chars.m
//  Polymorphism
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import "Chars.h"

@implementation Chars

-(void) setChars{
    
    c1='D';
    c2='S';
}
-(void) add;
{
    NSLog(@"%c%c",c1,c2);
}

-(void) print{
    
    NSLog(@"I am from the Chars class");
}
@end
