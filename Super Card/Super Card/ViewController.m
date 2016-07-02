//
//  ViewController.m
//  Super Card
//
//  Created by Deep Sidhpura on 4/30/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (strong, nonatomic) IBOutletCollection(PlayingCardView) NSArray *cardViewCollection;

@end

@implementation ViewController

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    self.playingCardView.faceUp=!self.playingCardView.faceUp;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.playingCardView.suit=@"♥";
    self.playingCardView.rank=13;
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pinch:)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
