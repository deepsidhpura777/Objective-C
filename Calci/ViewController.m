//
//  ViewController.m
//  Calci
//
//  Created by students on 11/09/15.
//  Copyright (c) 2015 students. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"
#import "HistoryViewController.h"

@interface ViewController ()


@property(strong,nonatomic) NSMutableString* history;
@property(strong,nonatomic) NSMutableArray * historyArray;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property(strong,nonatomic) Calculator * calci;
@property(nonatomic) int flag;
@property(nonatomic,strong) UIColor* color;
- (IBAction)operands:(UIButton *)sender;

- (IBAction)equals:(UIButton *)sender;
- (IBAction)decimal:(UIButton *)sender;

- (IBAction)cancel:(UIButton *)sender;
- (IBAction)operators:(UIButton *)sender;
@end

@implementation ViewController

-(Calculator *) calci{
    
    if (!_calci) _calci = [[Calculator alloc]init];
    
    return _calci;
}

-(NSMutableString *)history{
    
    if (!_history) {
        _history = [[NSMutableString alloc]init];
    }
    return _history;
}

-(NSMutableArray *)historyArray{
    
    if (!_historyArray) {
        _historyArray = [[NSMutableArray alloc]init];
    }
    return _historyArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.result.text = @"";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"calci"]) {
        HistoryViewController *h = (HistoryViewController *)segue.destinationViewController;
        h.history = self.historyArray;
        NSLog(@"History Array:%@",self.historyArray);
       
    }
    
}

- (IBAction)operands:(UIButton *)sender {
    
    if (self.flag) {
        self.result.text = [sender titleForState:UIControlStateNormal];
        self.flag = 0;
    }
    else{
    
        if (self.result.text) {
        
            NSMutableString * s = [[NSMutableString alloc]init];
            [s setString:self.result.text];
                [s appendString:[sender titleForState:UIControlStateNormal]];
        self.result.text = s;
        
        }
        else{
            self.result.text = [sender titleForState:UIControlStateNormal];
        
        }
    }
    
}

- (IBAction)equals:(UIButton *)sender {
    
    if(self.calci.operand1){
        self.calci.operand2 = [self.result.text floatValue];
        self.result.text = [self.calci equals];
        self.flag = 1;
        [self.history appendString:[NSString stringWithFormat:@"%.2f%@%@",self.calci.operand2,@"=",self.result.text]];
        self.calci.operand1 = 0 ;
        self.calci.operand2 = 0;
        
        NSMutableString * s = [[NSMutableString alloc]init];
        [s setString:self.history];
        [self.historyArray addObject:s];
        
       // NSLog(@"History: %@",self.history);
    }
}

- (IBAction)decimal:(UIButton *)sender {
    
    NSMutableString * s = [[NSMutableString alloc]init];
    [s setString:self.result.text];
    [s appendString:@"."];
    self.result.text = s;

    
}

- (IBAction)cancel:(UIButton *)sender {
    self.result.text = @"";
    self.flag = 0 ;
}

- (IBAction)operators:(UIButton *)sender {
    
    if (![self.result.text  isEqual: @""]) {
        
       // NSLog(@"In If");
        self.calci.op = [sender titleForState:UIControlStateNormal];
        self.calci.operand1 = [self.result.text floatValue];
        //  self.result.text = @"";
        self.flag = 1;
        if (self.history) {
            [self.history setString:@""];
        }
        [self.history setString:self.result.text];
        [self.history appendString:self.calci.op];
        
    }
    else{
        self.result.text = [sender titleForState:UIControlStateNormal];
        NSLog(@"In else");
    }
    
    
}
@end
