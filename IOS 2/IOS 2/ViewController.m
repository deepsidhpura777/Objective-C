//
//  ViewController.m
//  IOS 2
//
//  Created by Deep Sidhpura on 1/21/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelText;

-(IBAction)clicked:(id)sender{
    
    NSString *title=[sender titleForState:UIControlStateNormal];
    //NSString *newLableText=[[NSString alloc]initWithFormat:@"%@",title];
    labelText.text=title;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

/*-(void)viewDidUnload{
    
    self.labelText=nil;
}*/



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
