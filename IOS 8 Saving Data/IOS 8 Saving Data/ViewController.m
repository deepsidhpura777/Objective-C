//
//  ViewController.m
//  IOS 8 Saving Data
//
//  Created by Deep Sidhpura on 2/12/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize f1;

- (void)viewDidLoad
{
    NSString *filepath=[self pathOfFile];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filepath]) {
        
        NSArray *array=[[NSArray alloc]initWithContentsOfFile:filepath];
        f1.text=[array objectAtIndex:0];
    }
    
    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillTerminate:)name:UIApplicationWillTerminateNotification object:app];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*) pathOfFile{
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentFolder=[paths objectAtIndex:0];
    return [documentFolder stringByAppendingFormat:@"myfile.plist"];
}

-(void) applicationWillTerminate:(NSNotification*)notification{
    
    NSMutableArray *array=[[NSMutableArray alloc]init];
    [array addObject:f1.text];
    [array writeToFile:[self pathOfFile] atomically:YES];
    
}
@end
