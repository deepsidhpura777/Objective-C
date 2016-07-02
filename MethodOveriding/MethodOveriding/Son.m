//
//  Son.m
//  MethodOveriding
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import "Son.h"

@implementation Son  //The son can overide the methods of the Mom which when called with the son object will produce the results of the son's desire.

-(void) setNum{
    
    n=19;
}

-(void) print{
    
    NSLog(@"The num in son is:%i",n);
}

@end
