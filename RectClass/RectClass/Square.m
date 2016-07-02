//
//  Square.m
//  RectClass
//
//  Created by Deep Sidhpura on 12/11/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import "Square.h"

@implementation Square : Rectangle

-(void) setSide:(int)s1{
    [self setWH: s1:s1];  // here we are just using the method without changing the implementation at all.Without it, we wont be able to USE ,NOT MODIFY  the methods of our super class.self is a pointer to the current object.therfore the object of square class will be referenced which will call the setWH method.
}

-(int) side{

    return width;
}

@end
