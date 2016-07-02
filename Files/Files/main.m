//
//  main.m
//  Files
//
//  Created by Deep Sidhpura on 1/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
    
        NSString *d;
        NSFileManager *manager;
        
        manager=[NSFileManager defaultManager];
        
        d=[manager currentDirectoryPath];
        NSLog(@"%@",d);
            
            
            
        }
        
    
    return 0;
}

