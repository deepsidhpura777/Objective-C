//
//  SwitchClass.h
//  IOS 6
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlueClass;
@class RedClass;

@interface SwitchClass : UIViewController{
    
    RedClass *redClass;
    BlueClass *blueClass;
}
@property(retain,nonatomic) RedClass *redClass;
@property(nonatomic,retain) BlueClass *blueClass;

-(IBAction)switchViews:(id)sender;


@end
