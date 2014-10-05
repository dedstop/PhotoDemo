//
//  FacebookCategoryList.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookCategoryList.h"

@implementation FacebookCategoryList

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.facebookCategoryListId forKey:@"facebookCategoryListId"];
    [encoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.facebookCategoryListId = [decoder decodeObjectForKey:@"facebookCategoryListId"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

+ (FacebookCategoryList *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookCategoryList *instance = [[FacebookCategoryList alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"facebookCategoryListId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.facebookCategoryListId) {
        [dictionary setObject:self.facebookCategoryListId forKey:@"facebookCategoryListId"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    return dictionary;

}

@end
