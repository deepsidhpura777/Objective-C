//
//  main.m
//  Arrays
//
//  Created by Deep Sidhpura on 12/17/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
       // NSArray *cars=[NSArray arrayWithObjects:@"Labhorgini",@"Ferrari",@"Mclaren",@"Porsche Carrera GT", nil];
        NSMutableArray *num=[NSMutableArray arrayWithCapacity:25];
        
        for(int i=0;i<10;i++){
            
            [num insertObject:[NSNumber numberWithInteger:i*2] atIndex:i];
        }
        
       /* for(int i=0;i<4;i++)
        {
            NSLog(@"%i %@",i+1,[cars objectAtIndex:i]);
        }*/
        
        for(int i=0;i<[num count];i++){
            
            int n=2*[[num objectAtIndex:i] intValue];
            
            NSLog(@"%i",n);
            
           // NSLog(@"%i Number:%@",i,[num objectAtIndex:i]);
            
        }
        
    }
    return 0;
}

