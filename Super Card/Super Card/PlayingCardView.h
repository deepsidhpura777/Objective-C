//
//  PlayingCardView.h
//  Super Card
//
//  Created by Deep Sidhpura on 4/30/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;
-(void)pinch:(UIPinchGestureRecognizer *) gesture;

@end
