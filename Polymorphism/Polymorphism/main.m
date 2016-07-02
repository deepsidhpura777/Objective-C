//
//  main.m
//  Polymorphism
//
//  Created by Deep Sidhpura on 12/12/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Nums.h"
#import "Chars.h"

@interface Nums (moreMeth) //Concept of catagories ie adding more methods to classes without interfering with the original code 

-(void) multiply;
-(void) subtract;

@end

@implementation Nums (moreMeth)

-(void) multiply{
    
    NSLog(@"The multiplication is:%i",num1*num2);
}

-(void) subtract{
    
    NSLog(@"The subtraction is:%i",num1-num2);
}
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        id deep;
        
        Nums *n=[[Nums alloc]init];
        Chars *c=[[Chars alloc]init];
        
        deep=n;   //Using the concept of polymorphism at its very best by using a generic data type.
        
        [deep setNums:10 :15];
        [deep add];
        [deep multiply];
        [deep subtract];
        [deep print];
        
        deep=c;
        
        [deep setChars];
        [deep add];
        [deep print];
        
    }
    return 0;
}

