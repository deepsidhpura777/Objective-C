//
//  main.m
//  ArrayTest
//
//  Created by Deep Sidhpura on 3/22/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int c=0;
        NSMutableArray *slidingresult=[[NSMutableArray alloc]init];
        [slidingresult insertObject:@"Deep" atIndex:c++];
        [slidingresult insertObject:@"Nidhi" atIndex:c++];
        [slidingresult insertObject:@"Darshit" atIndex:c++];
        [slidingresult insertObject:@"harsg" atIndex:c++];
        
        for (int i=0; i<[slidingresult count]; i++) {
            NSLog(@"The contents are:%@",slidingresult[i]);
        }
    
    }
    return 0;
}

