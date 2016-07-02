//
//  Deep1.m
//  Classes
//
//  Created by Deep Sidhpura on 12/11/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import "Deep1.h"

@implementation Deep1

@synthesize age,weight; //syntesizing the properties ie getter method 
    
-(void) print{

    NSLog(@"I am %i yrs old and %i pounds",age,weight);
    
}
/*-(void) setWeight:(int)w{
    
    weight=w;
}

-(void) setAge:(int)a{
    
    age=a;
}*/

-(void) add:(int)m :(int)n{
    
    NSLog(@"The sum of two nos is:%i",m+n);
}

@end
