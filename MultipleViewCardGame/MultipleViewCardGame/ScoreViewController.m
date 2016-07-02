//
//  ScoreViewController.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 4/26/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@property(nonatomic) NSDictionary * dict;
@property (strong, nonatomic) IBOutlet UITextView *displayText;

@end

@implementation ScoreViewController




-(NSDictionary*) dict{
    
         if(!_dict)
        _dict=[[NSDictionary alloc]init];
    
    return _dict;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSUserDefaults* defaults=[NSUserDefaults standardUserDefaults];
    
    self.dict=[defaults dictionaryRepresentation];
    [self updateUI];
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    NSUserDefaults* defaults=[NSUserDefaults standardUserDefaults];
    self.dict=[defaults dictionaryRepresentation];
    self.displayText.text=@" ";
    [self updateUI];
    
}

-(void)updateUI{
    
    NSArray *array=[[NSArray alloc]init];
            array=[self.dict allValues];
    //[array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"Count:%lu",(unsigned long)[array count]);
    for (int i=0; i<[array count]; i++) {
        NSMutableString * temp=[[NSMutableString alloc]init];
        temp=[NSMutableString stringWithFormat:@"%@",array[i]];
        
        if([temp length]==14 || [temp length]==15 ||[temp length]==13 ||[temp length]==16){
        self.displayText.text=[NSMutableString stringWithFormat:@"%@ %@\n",self.displayText.text,array[i]];
        }
    }
    }
    


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
