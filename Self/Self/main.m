//
//  main.m
//  Self
//
//  Created by Deep Sidhpura on 1/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mom.h"
#include "Son.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Mom *m=[[Mom alloc]init];
        [m setAge];
        
        Son *s=[[Son alloc]init];
        [s setAge];
        NSLog(@"The age of the mom is %i",[m getAge]);
        NSLog(@"The age of the son is %i",[s getAge]);
    }
    return 0;
}

