//
//  FlickrData.h
//  
//
//  Created by Edward Kim on 10/6/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FlickrDataPhotos;

@interface FlickrDataResponse : NSObject <NSCoding> 
@property (nonatomic, strong) FlickrDataPhotos *photos;
@property (nonatomic, copy) NSString *stat;

+ (FlickrDataResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
