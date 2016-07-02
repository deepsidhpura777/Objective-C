//
//  SwitchClass.m
//  IOS 6
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "SwitchClass.h"
#import "BlueClass.h"
#import "RedClass.h"

@interface SwitchClass ()

@end

@implementation SwitchClass

@synthesize blueClass;
@synthesize redClass;

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
    BlueClass *blue=[[BlueClass alloc]initWithNibName:@"BlueClass" bundle:nil];
    self.blueClass=blue;
    [self.view insertSubview:blue.view atIndex:0];//loading the subview of blue class at the start.
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) switchViews:(id)sender{
    
    if(self.redClass.view.superview==nil){
        
        if(self.redClass==nil){
            
            RedClass *red=[[RedClass alloc]initWithNibName:@"RedClass" bundle:nil];
            self.redClass=red;
            
        }
        [blueClass.view removeFromSuperview];
        [self.view insertSubview:redClass.view atIndex:0];
    }
    else{
        
        if(self.blueClass==nil){
            
            BlueClass *blue=[[BlueClass alloc]initWithNibName:@"BlueClass" bundle:nil];
            self.blueClass=blue;
            
        }
        
        [redClass.view removeFromSuperview];
        [self.view insertSubview:blueClass.view atIndex:0];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    if(self.blueClass.view.superview==nil)
        self.blueClass=nil;
    else
        self.redClass=nil;
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
