//
//  FacebookPlace.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FacebookPlaceLocation;

@interface FacebookPlace : NSObject <NSCoding> 

@property (nonatomic, copy) NSString *facebookPlaceId;
@property (nonatomic, strong) FacebookPlaceLocation *location;
@property (nonatomic, copy) NSString *name;

+ (FacebookPlace *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
