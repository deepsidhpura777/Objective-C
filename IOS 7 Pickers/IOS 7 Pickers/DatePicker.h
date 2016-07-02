//
//  DatePicker.h
//  IOS 7 Pickers
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DatePicker : UIViewController{
    
    UIDatePicker *datePicker;
}
@property (nonatomic,retain) IBOutlet UIDatePicker *datePicker;
-(IBAction) pressedButton;

@end
