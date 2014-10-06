//
//  FlickrDataPhotos.h
//  
//
//  Created by Edward Kim on 10/6/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrDataPhotos : NSObject <NSCoding> 
@property (nonatomic, copy) NSNumber *page;
@property (nonatomic, copy) NSNumber *pages;
@property (nonatomic, copy) NSNumber *perpage;
@property (nonatomic, copy) NSArray *photo;
@property (nonatomic, copy) NSNumber *total;

+ (FlickrDataPhotos *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
