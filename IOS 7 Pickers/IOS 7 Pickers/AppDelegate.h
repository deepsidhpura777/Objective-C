//
//  AppDelegate.h
//  IOS 7 Pickers
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    UIWindow *window;
    UITabBarController *rootController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property(nonatomic,retain) IBOutlet UITabBarController *rootController;

@end
