//
//  FlickrPhotosTVC.m
//  FlickrMania
//
//  Created by Deep Sidhpura on 6/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "FlickrPhotosTVC.h"
#import "FlickrFetcher.h"
#import "FlickrHelper.h"
#import "JustPostedPhotos.h"

@interface FlickrPhotosTVC ()
@property(nonatomic,strong) NSDictionary *placesByCountry;
@property(nonatomic,strong) NSArray *countries;

@end

@implementation FlickrPhotosTVC

-(void) setPlaces:(NSArray *)places{
    
    if (_places==places) {
        return;
    }
    _places=[FlickrHelper sortPlaces:places];
    
    self.placesByCountry=[FlickrHelper placesByCountries:_places];
    self.countries=[FlickrHelper countriesFromPlacesByCountry:self.placesByCountry];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return [self.countries count];
}




-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
   
    return self.countries[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [self.placesByCountry[self.countries[section]] count]; // returning places of the country of that particular section
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Place Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *place=self.placesByCountry[self.countries[indexPath.section]][indexPath.row];
    cell.textLabel.text=[FlickrHelper titleOfPlace:place];
    cell.detailTextLabel.text=[FlickrHelper subtitleOfPlace:place];
   
    
    return cell;
}


#pragma mark - Navigation

//In a story board-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
            if (indexPath) {
                if ([segue.identifier isEqualToString:@"Place Url"]) {
                    if ([segue.destinationViewController isKindOfClass:[JustPostedPhotos class]]) {
                        
                        JustPostedPhotos *tvc=(JustPostedPhotos *)segue.destinationViewController;
                        NSDictionary *place=self.placesByCountry[self.countries[indexPath.section]][indexPath.row];
                        id placeId=[place valueForKeyPath:FLICKR_PLACE_ID];
                        NSURL *url=[FlickrFetcher URLforPhotosInPlace:placeId maxResults:50];
                        tvc.url=url;
                    }
                    
            }
        }
    }

}

 

@end
