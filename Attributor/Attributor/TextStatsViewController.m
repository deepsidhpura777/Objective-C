//
//  TextStatsViewController.m
//  Attributor
//
//  Created by Deep Sidhpura on 3/24/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colorfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorfulOutlinedLabel;

@end

@implementation TextStatsViewController

-(void)setTextToAnalyze:(NSAttributedString *)textToAnalyze{
    
    _textToAnalyze=textToAnalyze;
    if (self.view.window) {
        [self updateUI];
    }
}

/*-(void) viewDidLoad{
    
    [super viewDidLoad];
    self.textToAnalyze =[[NSAttributedString alloc] initWithString:@"test" attributes:@{NSForegroundColorAttributeName:[UIColor greenColor],NSStrokeWidthAttributeName:@-3}];
}*/

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self updateUI];
}



-(void ) updateUI{
    
  self.colorfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colorful characters",(unsigned long)[[self charactersWithAttribute:NSForegroundColorAttributeName]length]];
    
  self.colorfulOutlinedLabel.text = [NSString stringWithFormat:@"%lu outlined characters",[[self charactersWithAttribute:NSStrokeWidthAttributeName]length]];
    
}

-(NSAttributedString *) charactersWithAttribute:(NSString *)attributeName{
    
    NSMutableAttributedString *characters=[[NSMutableAttributedString alloc]init];
    int index=0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value=[self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index=(int)(range.location+range.length);
        }else{
            index++;
        }
    }
    
    return characters;
}

@end
