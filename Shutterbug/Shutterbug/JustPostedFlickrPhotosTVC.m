//
//  JustPostedFlickrPhotosTVC.m
//  Shutterbug
//
//  Created by Deep Sidhpura on 6/17/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "JustPostedFlickrPhotosTVC.h"
#import "FlickrFetcher.h"

@interface JustPostedFlickrPhotosTVC ()

@end

@implementation JustPostedFlickrPhotosTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self fetchPhotos];
}

-(IBAction)fetchPhotos{
    
//instead of doing session configuration and other stuff we had done in image view controller, we can create our own queue.
    
    [self.refreshControl beginRefreshing];
    
    NSURL *url=[FlickrFetcher URLforRecentGeoreferencedPhotos]; //fetches the url required
    dispatch_queue_t fetchQ=dispatch_queue_create("Flickr Fetcher", NULL);
    dispatch_async(fetchQ, ^{
        NSData *jsonResults=[NSData dataWithContentsOfURL:url];  //Fickr has json format for data. we need to arrange it in arrays and dictionaries.
        NSDictionary *propertyListResults=[NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
        NSLog(@"Flickr Results = %@",propertyListResults);
        
        NSArray *photos=[propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS]; // fetching photos from the flickr dataview. refer flickr fetcher and output to understand hoe dictionary keys are obtained
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.refreshControl endRefreshing];
            self.photos=photos;
        });
        
    });
    
    
    }



@end
