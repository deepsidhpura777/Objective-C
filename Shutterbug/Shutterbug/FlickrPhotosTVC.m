//
//  FlickrPhotosTVC.m
//  Shutterbug
//
//  Created by Deep Sidhpura on 6/17/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "FlickrPhotosTVC.h"
#import "FlickrFetcher.h"
#import "ImageViewController.h"

@interface FlickrPhotosTVC ()

@end

@implementation FlickrPhotosTVC

-(void) setPhotos:(NSArray *)photos{  //We create another subclass which fetches photos and sets them here
    
    _photos=photos;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    // Return the number of rows in the section.
    return [self.photos count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Flickr Photo Cell"; // identifier in Table View cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *photo = self.photos[indexPath.row];
    cell.textLabel.text=[photo valueForKeyPath:FLICKR_PHOTO_TITLE];
    cell.detailTextLabel.text=[photo valueForKeyPath:FLICKR_PHOTO_DESCRIPTION];
    
    
    return cell;
}

#pragma mark -UITableViewDelegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    id detail=self.splitViewController.viewControllers[1];
    if ([detail isKindOfClass:[UINavigationController class]]) {
        detail=[((UINavigationController *)detail).viewControllers firstObject]; //we embeded detail inside a navigation controller thats why we would have to check.
    }
    if ([detail isKindOfClass:[ImageViewController class]]) {
        
        [self prepareImageViewController:detail toDisplayPhoto:self.photos[indexPath.row]];
    }
    
}

#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation

-(void) prepareImageViewController:(ImageViewController *)ivc toDisplayPhoto:(NSDictionary *)photo{
    
    ivc.imageUrl=[FlickrFetcher URLforPhoto:photo format:FlickrPhotoFormatLarge];
    ivc.title=[photo valueForKeyPath:FLICKR_PHOTO_TITLE];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        
    
        NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];
        if (indexPath) {
        
            if ([segue.identifier isEqualToString:@"Display Photo"]) {
                if ([segue.destinationViewController isKindOfClass:[ImageViewController class]]) {
                    
                    [self prepareImageViewController:segue.destinationViewController toDisplayPhoto:self.photos[indexPath.row]];
                    
                }
            }
        }
    }
}



@end
