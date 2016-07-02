//
//  DropItBehavior.h
//  DropIt
//
//  Created by Deep Sidhpura on 5/12/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropItBehavior : UIDynamicBehavior

-(void)addItem:(id <UIDynamicItem>) item;
-(void)removeItem:(id <UIDynamicItem>) item;

@end
