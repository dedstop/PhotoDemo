//
//  FacebookPaging.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FacebookCursors;

@interface FacebookPaging : NSObject <NSCoding> 

@property (nonatomic, strong) FacebookCursors *cursors;
@property (nonatomic, copy) NSString *next;
@property (nonatomic, copy) NSString *previous;

+ (FacebookPaging *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
