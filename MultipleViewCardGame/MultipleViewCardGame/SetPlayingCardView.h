//
//  SetPlayingCardView.h
//  SampleThreeCardView
//
//  Created by Deep Sidhpura on 6/2/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetPlayingCardView : UIView


@property(nonatomic) NSUInteger rank;
@property(nonatomic) NSString* shape;
@property (nonatomic) NSString* shading;
@property(nonatomic) NSString * color;

@property (nonatomic) BOOL faceUp;
@property (nonatomic) BOOL enabled;
@property(nonatomic) BOOL chosen;
-(void)tap:(UITapGestureRecognizer *) gesture;

@end
