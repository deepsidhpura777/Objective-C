//
//  HistoryViewController.m
//  Calci
//
//  Created by students on 14/09/15.
//  Copyright (c) 2015 students. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textArea;


@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i<[self.history count]; i++) {
        self.textArea.text = [NSMutableString stringWithFormat:@"%@\n\n%@",self.textArea.text,self.history[i]];
    }
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
