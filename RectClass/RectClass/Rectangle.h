//
//  Rectangle.h
//  RectClass
//
//  Created by Deep Sidhpura on 12/11/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XY;
@interface Rectangle : NSObject{ //What we are doing here is basically giving the rectangle another property  called as origin.its the object of XY class which has the coordinates of that origin ie its own properties.

    int width,length;
    XY *origin;
}

@property int width,length;
@property XY* origin;

-(int) area;
-(int) peri;
//-(int) width;
//-(int) length;
//-(void) setWidth:(int) w;
//-(void) setLength:(int) l;
-(void) setWH:(int) w :(int) l;
//-(void) setOrigin:(XY *) oVal;
//-(XY *) origin;
@end
