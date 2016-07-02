//
//  main.m
//  GlobalExternalVariables
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tuna.h"

int gDrunk=21;

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        NSLog(@"The old age is:%i",gDrunk);
        
        Tuna *fish=[[Tuna alloc]init];
        
        [fish changeVar];
        
        NSLog(@"The new age is:%i",gDrunk);
    }
    return 0;
}

