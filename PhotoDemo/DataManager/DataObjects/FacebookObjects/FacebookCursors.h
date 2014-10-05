//
//  FacebookCursors.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FacebookCursors : NSObject <NSCoding> 

@property (nonatomic, copy) NSString *after;
@property (nonatomic, copy) NSString *before;

+ (FacebookCursors *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
