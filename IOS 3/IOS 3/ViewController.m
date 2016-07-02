//
//  ViewController.m
//  IOS 3
//
//  Created by Deep Sidhpura on 1/21/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize name;
@synthesize pass;
@synthesize sLabel;
@synthesize s;

-(IBAction) sliding{
    
    //UISlider *s=(UISlider *) sender;
    int value=(int)s.value;

    NSString *newLabel=[[NSString alloc]initWithFormat:@"%i",value];
    sLabel.text=newLabel;
    
}

-(IBAction) goAwayKeyBoard:(id)sender{
    
    [sender resignFirstResponder];
}

-(IBAction) tapBackGround:(id)sender{
    
    [name resignFirstResponder];
    [pass resignFirstResponder];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
