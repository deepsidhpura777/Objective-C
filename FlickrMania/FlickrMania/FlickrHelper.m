//
//  FlickrHelper.m
//  FlickrMania
//
//  Created by Deep Sidhpura on 6/22/14.
//  Copyright (c) 2014 Deep Sidhpura. All rights reserved.
//

#import "FlickrHelper.h"
#import "FlickrFetcher.h"

@implementation FlickrHelper

+(NSString *) titleOfPlace:(NSDictionary *) place{
    
    return [[[place valueForKeyPath:FLICKR_PLACE_NAME]componentsSeparatedByString:@", "]firstObject];
}

+(NSString *) subtitleOfPlace:(NSDictionary *) place{
    
    NSArray *nameParts=[[place valueForKeyPath:FLICKR_PLACE_NAME]componentsSeparatedByString:@", "];
    NSRange range;
    range.location=1;
    range.length=[nameParts count]-2;
    return [[nameParts subarrayWithRange:range]componentsJoinedByString:@", "];
}

+(NSString *) countryOfPlace:(NSDictionary *)place{
    
    return [[[place valueForKeyPath:FLICKR_PLACE_NAME]componentsSeparatedByString:@", "]lastObject];
    
}

+(NSArray *) sortPlaces:(NSArray *)places{
    return [places sortedArrayUsingComparator:^NSComparisonResult(id obj1,id obj2){
        NSString *name1=[obj1 valueForKeyPath:FLICKR_PLACE_NAME];
        NSString *name2=[obj2 valueForKeyPath:FLICKR_PLACE_NAME];
        return [name1 localizedCompare:name2];
        
    }];
    
}

+(NSDictionary *)placesByCountries:(NSArray *)places{
    
    NSMutableDictionary *placesByCountry=[NSMutableDictionary dictionary];
    for (NSDictionary *place in places) {
        NSString *country=[FlickrHelper countryOfPlace:place];
        NSMutableArray *placesOfCountry=placesByCountry[country]; //retrieving the current places of the country stored
        if (!placesOfCountry) {
            placesOfCountry=[NSMutableArray array];
            placesByCountry[country]=placesOfCountry;
        }
        [placesOfCountry addObject:place]; //adding to the same array instance
    }
    return placesByCountry;
}

+(NSArray *) countriesFromPlacesByCountry:(NSDictionary *)placesByCountry{
    
    NSArray *countries=[placesByCountry allKeys];
    countries=[countries sortedArrayUsingComparator:^(id a,id b){
        return [a compare:b options:NSCaseInsensitiveSearch];
    }];
    
    return countries;
}

@end
