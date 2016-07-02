//
//  ViewController.m
//  IOS 4
//
//  Created by Deep Sidhpura on 1/23/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize left;
@synthesize right;
@synthesize button;

-(IBAction) mainControlSegment:(id)sender{
    
    if ([sender selectedSegmentIndex]==0){
        
        left.hidden=NO;
        right.hidden=NO;
        button.hidden=YES;
    }
    
    else{
        
        
        left.hidden=YES;
        right.hidden=YES;
        button.hidden=NO;
    }
    
    
}
-(IBAction) switchChange:(id)sender{
    
    UISwitch *s=(UISwitch *)sender;
    BOOL yn=s.isOn;
    [left setOn:yn animated:YES];
    [right setOn:yn animated:YES];
    
    
}
-(IBAction) buttonPress{
    
    UIActionSheet *sheet=[[UIActionSheet alloc] initWithTitle:@"Want to see an alert?" delegate:self cancelButtonTitle:@"cancel" destructiveButtonTitle:@"Yaa I wanna see it." otherButtonTitles:nil];
    
    [sheet showInView:self.view];  //current view controller
    
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex!=[actionSheet cancelButtonIndex]) {
        
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Hey Deep" message:@"This is your first alert view" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles: nil];
        
        [alert show];
    }
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
