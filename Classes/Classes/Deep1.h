//
//  Deep1.h
//  Classes
//
//  Created by Deep Sidhpura on 12/11/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deep1 : NSObject{
    
    int age;
    int weight;
}

@property int age,weight;   // setting properties age,weight
-(void) print;
/*-(void) setAge:(int) a;
-(void) setWeight:(int) w;*/
-(void) add :(int) m :(int) n;

@end
