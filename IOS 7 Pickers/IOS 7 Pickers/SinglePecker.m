//
//  SinglePecker.m
//  IOS 7 Pickers
//
//  Created by Deep Sidhpura on 2/3/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "SinglePecker.h"

@interface SinglePecker ()

@end

@implementation SinglePecker

@synthesize singlePicker;
@synthesize pickerArray;

-(IBAction) pressButton{
    
    NSInteger row=[singlePicker selectedRowInComponent:0]; // chooses the index which is on the picker.Since single picker there is only one component.
    NSString *choice=[pickerArray objectAtIndex:row];
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Title" message:choice delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles: nil ];
    
    [alert show];
    
    
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [pickerArray count];
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return [pickerArray objectAtIndex:row];
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
    NSArray *x=[[NSArray alloc]initWithObjects:@"Deep",@"Nidhi",@"Harshu",@"Darshit",@"Mohit",nil];
    
    self.pickerArray=x;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
