//
//  JustPostedPhotos.m
//  FlickrMania
//
//  Created by Deep Sidhpura on 6/22/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "JustPostedPhotos.h"
#import "FlickrFetcher.h"

@interface JustPostedPhotos ()

@end

@implementation JustPostedPhotos


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self fetchPhotos];
}

-(void) fetchPhotos{
    
    NSData *jsonResults=[NSData dataWithContentsOfURL:self.url];
    NSDictionary *propertyListResults=[NSJSONSerialization JSONObjectWithData:jsonResults options:0 error:NULL];
   // NSLog(@"Flickr Results = %@",propertyListResults);
    NSArray *photos=[propertyListResults valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    self.photos=photos;
    
}


@end
