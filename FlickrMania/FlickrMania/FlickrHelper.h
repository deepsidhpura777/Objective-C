//
//  FlickrHelper.h
//  FlickrMania
//
//  Created by Deep Sidhpura on 6/22/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrHelper : NSObject

+(NSString *) titleOfPlace:(NSDictionary *) place;
+(NSString *) subtitleOfPlace:(NSDictionary *) place;
+(NSString *) countryOfPlace:(NSDictionary *)place;
+(NSArray *) sortPlaces:(NSArray *)places;
+(NSDictionary *)placesByCountries:(NSArray *)places;
+(NSArray *) countriesFromPlacesByCountry:(NSDictionary *)placesByCountry;



@end
