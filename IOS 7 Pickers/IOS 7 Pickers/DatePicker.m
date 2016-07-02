//
//  DatePicker.m
//  IOS 7 Pickers
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "DatePicker.h"

@interface DatePicker ()

@end

@implementation DatePicker

@synthesize datePicker;

-(IBAction)pressedButton{
    
    NSDate *choice=[datePicker date];
    NSString *words=[[NSString alloc]initWithFormat:@"This is %@",choice];
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"The Title" message:words delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    
    [alert show];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
