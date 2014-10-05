//
//  FacebookPhoto.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookPhoto : NSObject <NSCoding>

@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSNumber *width;

+ (FacebookPhoto *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
