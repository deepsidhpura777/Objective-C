//
//  ViewController.m
//  Imaginarium
//
//  Created by Deep Sidhpura on 6/12/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"
#import "ImageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
        ImageViewController* ivc=(ImageViewController *) segue.destinationViewController;
        ivc.imageUrl=[NSURL URLWithString:[NSString stringWithFormat:@"http://ibmsmartercommerce.sourceforge.net/wp-content/uploads/2012/09/Roses_Bunch_Of_Flowers.jpeg"]];
    }
    
}

@end
