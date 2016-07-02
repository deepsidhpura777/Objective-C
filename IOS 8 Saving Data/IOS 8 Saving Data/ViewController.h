//
//  ViewController.h
//  IOS 8 Saving Data
//
//  Created by Deep Sidhpura on 2/12/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    UITextField* f1;
}
@property(nonatomic,retain)IBOutlet UITextField* f1;

-(NSString*) pathOfFile;
-(void) applicationWillTerminate:(NSNotification*)notification;

@end
