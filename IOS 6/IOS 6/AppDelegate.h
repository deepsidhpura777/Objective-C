//
//  AppDelegate.h
//  IOS 6
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SwitchClass;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    UIWindow *window;
    SwitchClass *switchClass;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property(nonatomic,retain) IBOutlet SwitchClass *switchClass;

@end
