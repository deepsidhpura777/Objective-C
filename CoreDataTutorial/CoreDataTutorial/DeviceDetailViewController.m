//
//  DeviceDetailViewController.m
//  CoreDataTutorial
//
//  Created by Deep Sidhpura on 8/2/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "DeviceDetailViewController.h"

@interface DeviceDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *versionTextField;
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;

@end

@implementation DeviceDetailViewController

-(NSManagedObjectContext *)managedObjectContext{
    
    NSManagedObjectContext *context=nil;
    id delegate=[[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context=[delegate managedObjectContext];
    }
    return context;
}




- (IBAction)save:(id)sender {
    NSManagedObjectContext *context=[self managedObjectContext];
    NSManagedObject *newDevice=[NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    [newDevice setValue:self.nameTextField forKey:@"name"];
    [newDevice setValue:self.versionTextField forKey:@"version"];
    [newDevice setValue:self.companyTextField forKey:@"company"];
    
    NSError *error=nil;
    if (![context save:&error]) {
        NSLog(@"Cant save! %@ %@",error,[error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
   
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
