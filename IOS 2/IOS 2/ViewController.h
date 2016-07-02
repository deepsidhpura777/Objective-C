//
//  ViewController.h
//  IOS 2
//
//  Created by Deep Sidhpura on 1/21/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    UILabel *labelText;
}

@property(nonatomic,retain) IBOutlet UILabel *labelText;
-(IBAction)clicked:(id)sender;

@end
