//
//  SinglePecker.h
//  IOS 7 Pickers
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePecker : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>{
    
    UIPickerView *singlePicker;
    NSArray *pickerArray;
}

@property(nonatomic,retain) IBOutlet UIPickerView *singlePicker;
@property(nonatomic,retain) NSArray *pickerArray;
-(IBAction) pressButton;

@end
