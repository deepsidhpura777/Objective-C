//
//  CardGameView.h
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 5/12/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardGameView : UIView



@property (nonatomic) NSUInteger rank;
@property (strong,nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUp;
@property (nonatomic) BOOL enabled;
@property(nonatomic) BOOL chosen;
-(void)tap:(UITapGestureRecognizer *) gesture;

@end
