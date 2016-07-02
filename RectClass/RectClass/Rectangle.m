//
//  Rectangle.m
//  RectClass
//
//  Created by Deep Sidhpura on 12/11/13.
//  Copyright (c) 2013 Deep Sidhpura. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

@synthesize width,length;
@synthesize origin;

-(int) area{
    
    return width*length;
}

-(int)  peri{
    
    return (width+length)*2;
}

-(void) setWH:(int)w :(int)h{
    
    width=w;    length=h;
}

/*-(void) setOrigin:(XY *) oVal{
    
    origin=oVal;
}
-(XY *) origin{
    
    return origin;
}*/

/*-(void) setWidth:(int)w{
    
    width=w;
}

-(void) setLength:(int)l{
    
    length=l;
}
-(int) width{
    
    return width;
}

-(int) length{
    
    return length;
}*/

@end
