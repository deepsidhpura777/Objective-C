//
//  BezierPathView.m
//  DropIt
//
//  Created by Deep Sidhpura on 6/2/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) setPath:(UIBezierPath *)path{
    
    _path=path;
    [self setNeedsDisplay];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.*/

- (void)drawRect:(CGRect)rect
{
    [self.path stroke];
}


@end
