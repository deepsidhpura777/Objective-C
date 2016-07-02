//
//  FlickrPlacesPhotos.m
//  FlickrMania
//
//  Created by Deep Sidhpura on 6/22/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "FlickrPlacesPhotos.h"
#import "FlickrFetcher.h"
#import "ImageViewController.h"

@interface FlickrPlacesPhotos ()

@property(strong,nonatomic) NSMutableArray * recentPhotos;

@end

@implementation FlickrPlacesPhotos

-(NSMutableArray *) recentPhotos{
    
    if(!_recentPhotos){
        _recentPhotos=[[NSMutableArray alloc]init];
        
    }
    
    return  _recentPhotos;
}

-(void) setPhotos:(NSArray *)photos{  //We create another subclass which fetches photos and sets them here
    
    _photos=photos;
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   
    // Return the number of rows in the section.
    return [self.photos count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Photo Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
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



#pragma mark- NSUserDefaults

-(void) defaultValues:(NSDictionary *) photo{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
   
    NSMutableArray *recents=[[NSMutableArray alloc] initWithArray:[defaults arrayForKey:@"Recent Photos"]];
    NSMutableIndexSet *indexes=[NSMutableIndexSet indexSet];
    
    for (NSDictionary *obj in recents) {
        if ([[photo valueForKeyPath:FLICKR_PHOTO_ID] isEqualToString: [obj valueForKeyPath:FLICKR_PHOTO_ID]]) {
            
            NSLog(@"Reched in for");
            int index=(int)[recents indexOfObject:obj];
            [indexes addIndex:index];
        }
        
    }
    NSLog(@"Index content:%@",indexes);
    NSLog(@"Recent Photos in Main before delete:%lu",(unsigned long)[recents count]);
    [recents removeObjectsAtIndexes:indexes];

    [recents addObject:photo];

   // NSArray *recentPhotos=(NSArray *)recents;
    NSLog(@"Recent Photos in Main:%lu",(unsigned long)[recents count]);

    [defaults setObject:recents forKey:@"Recent Photos"];
    
    [defaults synchronize];
    
}





#pragma mark - Navigation

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
                    NSDictionary *photo=[[NSDictionary alloc]init];
                    photo=self.photos[indexPath.row];
                    [self defaultValues:photo];
                }
            }
        }
    }
}




@end
