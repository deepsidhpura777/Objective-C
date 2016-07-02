//
//  SetPlayingCardView.m
//  SampleThreeCardView
//
//  Created by Deep Sidhpura on 6/2/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "SetPlayingCardView.h"

@implementation SetPlayingCardView

#define CORNER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

-(void) setShape:(NSString *) shape{
    
    _shape=shape;
    [self setNeedsDisplay];
    
    
}

-(void) setRank:(NSUInteger)rank{
    
    _rank=rank;
    [self setNeedsDisplay];
    
}

-(void)setShading:(NSString *)shading{
    
    _shading=shading;
    [self setNeedsDisplay];
}

-(void) setColor:(NSString *)color{
    
    _color=color;
    [self setNeedsDisplay];
}


-(void) setFaceUp:(BOOL)faceUp{
    
    _faceUp=faceUp;
    [self setNeedsDisplay];
    
    
}
-(CGFloat) cornerScaleFactor { return self.bounds.size.height / CORNER_FONT_STANDARD_HEIGHT ;}
-(CGFloat) cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
-(CGFloat) cornerOffset { return [self cornerRadius] / 3.0;}


-(void) setup{
    
    self.backgroundColor=nil;
    self.opaque=NO;
    self.contentMode=UIViewContentModeRedraw;
    
}

-(void) awakeFromNib{
    
    [self setup];
}

-(void) tap:(UITapGestureRecognizer *)gesture{
    
    
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect=[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
    [roundedRect addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    
    UIBezierPath *path=[[UIBezierPath alloc]init];
    if ([self.shape isEqualToString: @"oval"]) {
        path=[self drawOval];
        
    }
    if ([self.shape isEqualToString: @"diamond"]) {
        path=[self drawDiamond];
        
    }
    if ([self.shape isEqualToString: @"squiggle"]) {
        path=[self drawSquiggle];
    }
   [self applyProperties:path];
    
}

- (UIColor *)uiColor
{
    if ([self.color isEqualToString:@"red"]) return [UIColor redColor];
    if ([self.color isEqualToString:@"green"]) return [UIColor greenColor];
    if ([self.color isEqualToString:@"purple"]) return [UIColor purpleColor];
    return nil;
}

-(UIBezierPath *) drawOval{
    
    NSInteger center=self.bounds.size.height / 2;
    NSInteger start=self.bounds.origin.x + self.bounds.size.width/4.8;
  
    CGRect rect=CGRectMake(start, center-self.bounds.size.height / 10.2,self.bounds.size.width/1.71, self.bounds.size.height / 5.1);
    UIBezierPath *path =  [UIBezierPath bezierPathWithOvalInRect:rect];
    
    return path;
    
    
}

-(UIBezierPath *) drawDiamond{
    UIBezierPath *path=[[UIBezierPath alloc]init];
    NSInteger centerh=self.bounds.size.height / 2;
    NSInteger centerw=self.bounds.size.width/2;
    NSInteger start=self.bounds.origin.x + self.bounds.size.width/4.8;
    CGPoint myPoint1,myPoint2,myPoint3,myPoint4;
    
    myPoint1.x=start;
    myPoint1.y=centerh;
    
    myPoint2.x=centerw;
    myPoint2.y=centerh- (self.bounds.size.height / 10.2);
    
    myPoint3.x=self.bounds.size.width-self.bounds.size.width/4.8;
    myPoint3.y=centerh;
    
    myPoint4.x=centerw;
    myPoint4.y=centerh+(self.bounds.size.height / 10.2);
    
    
    [path moveToPoint:myPoint1];
    [path addLineToPoint:myPoint2];
    
    //[path moveToPoint:myPoint2];
    [path addLineToPoint:myPoint3];
    
  //  [path moveToPoint:myPoint3];
    [path addLineToPoint:myPoint4];
    [path closePath];
        
    
    
    return  path;
    
}

-(UIBezierPath *) drawSquiggle{
    UIBezierPath *path=[[UIBezierPath alloc]init];
   // UIBezierPath *path2=[[UIBezierPath alloc]init];
   // UIBezierPath *path3=[[UIBezierPath alloc]init];
    
    NSInteger centerh=self.bounds.size.height / 2;
    NSInteger centerw=self.bounds.size.width/2;
    NSInteger start=self.bounds.origin.x + self.bounds.size.width/4.8;
    CGPoint myPoint1,myPoint2,myPoint3,myPoint4,myPoint5,myPoint6;
    
   // CGAffineTransform transform=CGAffineTransformMakeTranslation(0, -30);
  //  CGAffineTransform transform2=CGAffineTransformMakeTranslation(0, 30);
    
    myPoint1.x=start;
    myPoint1.y=centerh;
    
    
    myPoint2.x=centerw;
                                                                  // myPoint2.y=centerh-40;
    myPoint2.y=centerh-(self.bounds.size.height / 5.1);
    
    
    
    //myPoint3.x=self.bounds.size.width-30;
    myPoint3.x=self.bounds.size.width - (self.bounds.size.width) / 4.8;
  
    
   // myPoint3.y=centerh-10;
    myPoint3.y=centerh-(self.bounds.size.height / 20.4);
    
    myPoint4.x=centerw;
    //myPoint4.y=centerh+20;
    myPoint4.y=centerh+(self.bounds.size.height / 10.2);
    
    myPoint5.x=centerw;
    //myPoint5.y=centerh-10;
    myPoint5.y=centerh-(self.bounds.size.height / 20.4);
    
    myPoint6.x=centerw;
   // myPoint6.y=centerh+40;
    myPoint6.y=centerh+(self.bounds.size.height / 5.1);
    
    [path moveToPoint:myPoint1];
    
    [path addCurveToPoint:myPoint3 controlPoint1:myPoint2 controlPoint2:myPoint4];
    [path moveToPoint:myPoint1];
    [path addCurveToPoint:myPoint3 controlPoint1:myPoint5 controlPoint2:myPoint6];
    
    return  path;
}

#define STRIPES_OFFSET 0.06
#define STRIPES_ANGLE 5
#define SYMBOL_LINE_WIDTH 0.02;

-(void) setProperties:(UIBezierPath *) path{
   
    
        if ([self.shading isEqualToString:@"fill"]) {
            [[self uiColor] setFill];
            [path fill];
        }
        if ([self.shading isEqualToString:@"outline"]) {
            [[self uiColor] setStroke];
            [path stroke];

        }
        if ([self.shading isEqualToString:@"stroke"]) {
            
            [[self uiColor] setStroke];
            [path stroke];
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSaveGState(context);
            [path addClip];
            UIBezierPath *stripes = [[UIBezierPath alloc] init];
            CGPoint start = self.bounds.origin;
            CGPoint end = start;
            CGFloat dy = self.bounds.size.height * STRIPES_OFFSET;
            end.x += self.bounds.size.width;
            start.y += dy * STRIPES_ANGLE;
            for (int i = 0; i < 1 / STRIPES_OFFSET; i++) {
                [stripes moveToPoint:start];
                [stripes addLineToPoint:end];
                start.y += dy;
                end.y += dy;
            }
            stripes.lineWidth = self.bounds.size.width / 2 * SYMBOL_LINE_WIDTH;
            [stripes stroke];
            CGContextRestoreGState(UIGraphicsGetCurrentContext());
        }
}


-(void) applyProperties:(UIBezierPath *) path{
    if (self.rank==1) {
        [self setProperties:path];
    }
    if (self.rank==2) {
        UIBezierPath *path2=[[UIBezierPath alloc] init];
        [path2 appendPath:path];
        CGAffineTransform transform=CGAffineTransformMakeTranslation(0, -(self.bounds.size.width) / 4.8);
        CGAffineTransform transform2=CGAffineTransformMakeTranslation(0, (self.bounds.size.width) / 4.8);
        [path applyTransform:transform];
        [path2 applyTransform:transform2];
        [self setProperties:path];
        [self setProperties:path2];
    }
    if (self.rank==3) {
        UIBezierPath *path2=[[UIBezierPath alloc] init];
        [path2 appendPath:path];
        UIBezierPath *path3=[[UIBezierPath alloc]init];
        [path3 appendPath:path];
        CGAffineTransform transform=CGAffineTransformMakeTranslation(0, -10-(self.bounds.size.height / 5.1));
        CGAffineTransform transform2=CGAffineTransformMakeTranslation(0, 10+(self.bounds.size.height / 5.1));
        [path2 applyTransform:transform];
        [path3 applyTransform:transform2];
        [self setProperties:path];
        [self setProperties:path2];
        [self setProperties:path3];
    }
    
    
}




@end
