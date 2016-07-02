//
//  RecentPhotos.m
//  FlickrMania
//
//  Created by Deep Sidhpura on 6/27/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "RecentPhotos.h"
#import "FlickrFetcher.h"

@interface RecentPhotos ()

@end

@implementation RecentPhotos

@synthesize recentPhotos=_recentPhotos;

-(NSMutableArray *)recentPhotos{
    
    if (!_recentPhotos) {
        _recentPhotos=[[NSMutableArray alloc]init];
    }
    return _recentPhotos;
}



-(void) setRecentPhotos:(NSMutableArray *)recentPhotos{  //We create another subclass which fetches photos and sets them here
    
    _recentPhotos=recentPhotos;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateUI];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateUI];
    
}


#pragma mark- Retrieving Defaults

-(void)updateUI{
    
    NSUserDefaults* defaults=[NSUserDefaults standardUserDefaults];
    NSArray * temp=(NSArray *)[defaults arrayForKey:@"Recent Photos"];
    int max;
    if ([temp count] > 20) {
        max=20;
    }
    else{
        max=(int)[temp count];
    }
    
    for (int i=1;i<=max;i++){
        
        self.recentPhotos[i-1]=temp[[temp count]-i];
    }
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.recentPhotos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Recent Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *photo = self.recentPhotos[indexPath.row];
    cell.textLabel.text=[photo valueForKeyPath:FLICKR_PHOTO_TITLE];
    cell.detailTextLabel.text=[photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
