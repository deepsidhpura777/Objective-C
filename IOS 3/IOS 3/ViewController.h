//
//  ViewController.h
//  IOS 3
//
//  Created by Deep Sidhpura on 1/21/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    UITextField *name;
    UITextField *pass;
    UILabel *sLabel;
    UISlider *s;
}

@property(retain,nonatomic) IBOutlet UITextField *name;
@property(retain,nonatomic) IBOutlet UITextField *pass;
@property(retain,nonatomic) IBOutlet UILabel *sLabel;
@property(retain,nonatomic) IBOutlet UISlider *s;


-(IBAction) sliding;
-(IBAction) goAwayKeyBoard:(id)sender;
-(IBAction) tapBackGround:(id)sender;
@end


