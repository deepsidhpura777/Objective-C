//
//  ViewController.m
//  SampleThreeCardView
//
//  Created by Deep Sidhpura on 6/2/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"
#import "SetPlayingCardView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet SetPlayingCardView *myView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myView.rank=2;
    self.myView.shape=@"oval";
    self.myView.color=@"red";
    self.myView.shading=@"stroke";
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
