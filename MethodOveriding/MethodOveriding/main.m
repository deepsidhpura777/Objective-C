//
//  main.m
//  MethodOveriding
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Son.h"
#import "Mom.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Son *s=[[Son alloc]init];
        Mom *m=[[Mom alloc]init];
        
        [s setNum];
        [s print];
        [m setNum];
        [m print];
    }
    return 0;
}

