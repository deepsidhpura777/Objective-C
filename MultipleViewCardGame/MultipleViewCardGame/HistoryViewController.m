//
//  HistoryViewController.m
//  MultipleViewCardGame
//
//  Created by Deep Sidhpura on 4/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textArea;



@end

@implementation HistoryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self updateUI];
}

-(void) updateUI{
    
    if(self.game==2){
        for (int i=0; i<[self.textHistory count]; i++) {
        self.textArea.text=[NSMutableString stringWithFormat:@"%@\n%@",self.textArea.text,self.textHistory[i]];
        }
    }
    
    if(self.game==3){
        for (int i=0; i<[self.textHistory count]; i++) {
            NSMutableAttributedString *t=[[NSMutableAttributedString alloc]init];
            
            [t setAttributedString:self.textArea.attributedText];
            [t appendAttributedString:self.textHistory[i]];
            [t appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
            self.textArea.attributedText=t;
        }
    }
}


@end
