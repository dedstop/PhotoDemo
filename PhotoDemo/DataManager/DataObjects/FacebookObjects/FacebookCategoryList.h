//
//  FacebookCategoryList.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookCategoryList : NSObject <NSCoding> 

@property (nonatomic, copy) NSString *facebookCategoryListId;
@property (nonatomic, copy) NSString *name;

+ (FacebookCategoryList *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
