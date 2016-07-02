//
//  main.m
//  NumberObjects
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSNumber *deepInt,*deepFloat;
        
        deepInt=[NSNumber numberWithInteger:16];
        deepFloat=[NSNumber numberWithFloat:15.50];
        
        if([deepInt compare :deepFloat]==NSOrderedAscending)
            NSLog(@"int lesser!!!");
        
        else
            NSLog(@"Float lesser");
        
        
    }
    return 0;
}

