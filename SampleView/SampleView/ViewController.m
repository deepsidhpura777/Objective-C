//
//  ViewController.m
//  SampleView
//
//  Created by Deep Sidhpura on 5/16/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "ViewController.h"
#import "Grid.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *gridView;
@property (strong, nonatomic) Grid *grid;
@property (strong, nonatomic) NSMutableArray *cardViews;

@end

@implementation ViewController

- (NSMutableArray *)cardViews
{
    if (!_cardViews) _cardViews = [NSMutableArray arrayWithCapacity:self.numberOfStartingCards];
    return _cardViews;
}

- (Grid *)grid
{
    if (!_grid) {
        _grid = [[Grid alloc] init];
        _grid.cellAspectRatio = self.maxCardSize.width / self.maxCardSize.height;
        _grid.minimumNumberOfCells = self.numberOfStartingCards;
        _grid.maxCellWidth = self.maxCardSize.width;
        _grid.maxCellHeight = self.maxCardSize.height;
        _grid.size = self.gridView.frame.size;
    }
    return _grid;
}

#define CARDSPACINGINPERCENT 0.10

-(NSMutableArray *) createView{
    for (NSUInteger cardIndex = 0;cardIndex < 12;cardIndex++){
        
        UIView *cardView=[[UIView alloc]init]; //This will be CardGameView for my class or else typecast.
        cardView.frame = CGRectMake(self.gridView.bounds.size.width-100,self.gridView.bounds.size.height-100,self.grid.cellSize.width,self.grid.cellSize.height);
        cardView.backgroundColor=[UIColor blueColor];
        [self.cardViews addObject:cardView];
        [self.gridView addSubview:cardView];
    }
    
self.grid.minimumNumberOfCells = [self.cardViews count];

NSUInteger changedViews = 0;
for (NSUInteger viewIndex = 0; viewIndex < [self.cardViews count]; viewIndex++) {
    CGRect frame = [self.grid frameOfCellAtRow:viewIndex / self.grid.columnCount
                                      inColumn:viewIndex % self.grid.columnCount];
    frame = CGRectInset(frame, frame.size.width * CARDSPACINGINPERCENT, frame.size.height * CARDSPACINGINPERCENT);
    UIView *cardView = (UIView *)self.cardViews[viewIndex];
    if (![self frame:frame equalToFrame:cardView.frame]) {
        [UIView animateWithDuration:0.5
                              delay:1.5 * changedViews++ / [self.cardViews count]
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             cardView.frame = frame;
                         } completion:NULL];
    }
    cardView.frame=frame;
    //cardView.backgroundColor=[UIColor redColor];
}
    return self.cardViews;
}

#define FRAMEROUNDINGERROR 0.01

- (BOOL)frame:(CGRect)frame1 equalToFrame:(CGRect)frame2
{
    if (fabs(frame1.size.width - frame2.size.width) > FRAMEROUNDINGERROR) return NO;
    if (fabs(frame1.size.height - frame2.size.height) > FRAMEROUNDINGERROR) return NO;
    if (fabs(frame1.origin.x - frame2.origin.x) > FRAMEROUNDINGERROR) return NO;
    if (fabs(frame1.origin.y - frame2.origin.y) > FRAMEROUNDINGERROR) return NO;
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.numberOfStartingCards = 12;
    self.maxCardSize = CGSizeMake(80.0, 120.0);
    NSMutableArray * myArray=[self createView];
    for (int i=0; i< [myArray count]; i++) {
        UIView* myView=myArray[i];
        myView.backgroundColor=[UIColor brownColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
