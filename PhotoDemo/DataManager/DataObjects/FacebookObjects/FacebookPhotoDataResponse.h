//
//  FacebookPhotoDataResponse.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FacebookPaging;

@interface FacebookPhotoDataResponse : NSObject <NSCoding>

@property (nonatomic, copy) NSArray *data;
@property (nonatomic, strong) FacebookPaging *paging;

+ (FacebookPhotoDataResponse *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
