//
//  main.m
//  UserStrings
//
//  Created by Deep Sidhpura on 1/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        char cString[100];
        int n[100];
        n[0]=1;
        n[1]=2;
        NSLog(@"%i %i",n[0],n[1]);
        NSString *d=@"Deep Sidhpura";
        NSMutableString *deep;
        deep=[NSMutableString stringWithString:d];
        [deep setString:@"Sidhpura"];
        NSLog(@"Enter the string:");
        scanf("%[^\n]s",cString);
        deep=[NSMutableString stringWithCString:cString encoding:NSASCIIStringEncoding];
        NSLog(@"My String is:%@",deep);
        NSLog(@"The length is:%lu",(unsigned long)[deep length]);
    }
    return 0;
}

