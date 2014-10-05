//
//  FacebookFrom.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookFrom : NSObject <NSCoding>

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSArray *categoryList;
@property (nonatomic, copy) NSString *facebookFromId;
@property (nonatomic, copy) NSString *name;

+ (FacebookFrom *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
