//
//  ViewController.m
//  IOS 9 Touch
//
//  Created by Deep Sidhpura on 2/13/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize firstLabel;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{ //touch event fires
    
    firstLabel.text=@"You touched the screen";
    
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    firstLabel.text=@"You lifted your finger";
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    firstLabel.text=@"You moved the finger";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
