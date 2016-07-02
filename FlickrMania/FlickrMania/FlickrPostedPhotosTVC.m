//
//  FlickrPostedPhotosTVC.m
//  FlickrMania
//
//  Created by Deep Sidhpura on 6/19/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "FlickrPostedPhotosTVC.h"
#import "FlickrFetcher.h"

@interface FlickrPostedPhotosTVC ()

@end

@implementation FlickrPostedPhotosTVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        [self fetchPhotos];
}

-(void)fetchPhotos{
    
    
    
    NSURL *url=[FlickrFetcher URLforTopPlaces];
    NSData *jsonResults=[NSData dataWithContentsOfURL:url];  //Fickr has json format for data. we need to arrange it in arrays and dictionaries.
    NSDictionary *topPlacesResults=[NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
   
    NSArray *places=[topPlacesResults valueForKeyPath:FLICKR_RESULTS_PLACES];//Array of Dictionaries of Place which will give placeID and content.
    self.places=places;
   

}

@end
