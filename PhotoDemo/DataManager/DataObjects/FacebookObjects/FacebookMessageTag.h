//
//  FacebookMessageTags.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookMessageTag : NSObject <NSCoding>

@property (nonatomic, copy) NSNumber *length;
@property (nonatomic, copy) NSString *messageTag;
@property (nonatomic, copy) NSNumber *offset;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *type;

+ (FacebookMessageTag *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
