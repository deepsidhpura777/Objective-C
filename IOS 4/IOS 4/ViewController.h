//
//  ViewController.h
//  IOS 4
//
//  Created by Deep Sidhpura on 1/23/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>{
    
    UISwitch *left;
    UISwitch *right;
    UIButton *button;
}
@property(nonatomic,retain) IBOutlet UISwitch *left;
@property(nonatomic,retain) IBOutlet UISwitch *right;
@property(nonatomic,retain) IBOutlet UIButton *button;

-(IBAction) mainControlSegment:(id)sender;
-(IBAction) switchChange:(id)sender;
-(IBAction) buttonPress;
@end
