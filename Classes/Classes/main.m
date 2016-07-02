//
//  main.m
//  Classes
//
//  Created by Deep Sidhpura on 12/11/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deep1.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Deep1 *deep=[[Deep1 alloc]init];
        
        deep.age=20;        //Directly Passing values into the properties age,weight;
        deep.weight=95;
        
        //[deep setAge:19];
        //[deep setWeight:80];
        [deep print];
        [deep add:100 :200];
        
        
    }
    return 0;
}

