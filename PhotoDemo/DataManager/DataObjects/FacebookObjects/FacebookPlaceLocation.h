//
//  FacebookPlaceLocation.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookPlaceLocation : NSObject <NSCoding>

@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSNumber *latitude;
@property (nonatomic, copy) NSNumber *longitude;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *zip;

+ (FacebookPlaceLocation *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
