//
//  main.m
//  SplitJoinString
//
//  Created by Deep Sidhpura on 1/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *deep=@"0,1,2,3,4,5";
        NSArray *list=[deep componentsSeparatedByString:@","]; //The splitted strings are stored in the list array
        for(int i=0;i<[list count];i++){
            
            NSLog(@"%@",[list objectAtIndex:i]);
            
        }
        
        NSString *joined=[list componentsJoinedByString:@"*"]; //The separate componenets in the array will be joined by the string passed and stored as one string.
        NSLog(@"%@",joined);
        
        
    }
    return 0;
}

