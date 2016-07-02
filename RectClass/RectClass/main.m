//
//  main.m
//  RectClass
//
//  Created by Deep Sidhpura on 12/11/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Square.h"
#import "XY.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int l,w,s;
        Rectangle * r=[[Rectangle alloc]init];
        Square * sq=[[Square alloc]init];
        XY *p=[[XY alloc]init];
        
          //[p setXY:100 :200];
        p.x=100;
        p.y=200;
          //[r setOrigin:p];
        r.origin=p;   //In order to set and use prop directly, we need setters and getters.That is the reason why syntesize is best coz it directly creates a setter and getter.
        
          NSLog(@"Enter the length of the rectangle:");
          scanf("%i",&l);
          NSLog(@"Enter the width of the rectangle:");
          scanf("%i",&w);
          NSLog(@"Enter the side of the square:");
          scanf("%i",&s);
        
        r.width=w;
        r.length=l;          //[r setWH: w+1 :l+1];
          [sq setSide: s]; // setSide is overriding the method setWH inherited from the Rectangle class
        
        
        NSLog(@"The length %i The width %i",r.length,r.width);
        NSLog(@"The area of the rectangle is:%i",[r area]);
        NSLog(@"The perimeter of the rectangle is:%i",[r peri]);
        //NSLog(@"The origin is:%i %i",[r getOrigin].x,[r getOrigin].y);
        NSLog(@"%i %i",r.origin.x,r.origin.y);
        
        NSLog(@"The area of the square is:%i",[sq area]);
        NSLog(@"The perimeter of the square is:%i",[sq peri]);
        
    }
    return 0;
}

