//
//  FacebookFrom.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookFrom.h"

#import "FacebookCategoryList.h"

@implementation FacebookFrom

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.category forKey:@"category"];
    [encoder encodeObject:self.categoryList forKey:@"categoryList"];
    [encoder encodeObject:self.facebookFromId forKey:@"facebookFromId"];
    [encoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.category = [decoder decodeObjectForKey:@"category"];
        self.categoryList = [decoder decodeObjectForKey:@"categoryList"];
        self.facebookFromId = [decoder decodeObjectForKey:@"facebookFromId"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

+ (FacebookFrom *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookFrom *instance = [[FacebookFrom alloc] init];
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

- (void)setValue:(id)value forKey:(NSString *)key
{

    if ([key isEqualToString:@"category_list"]) {

        if ([value isKindOfClass:[NSArray class]]) {

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                FacebookCategoryList *populatedMember = [FacebookCategoryList instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.categoryList = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"category_list"]) {
        [self setValue:value forKey:@"categoryList"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"facebookFromId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.category) {
        [dictionary setObject:self.category forKey:@"category"];
    }

    if (self.categoryList) {
        [dictionary setObject:self.categoryList forKey:@"categoryList"];
    }

    if (self.facebookFromId) {
        [dictionary setObject:self.facebookFromId forKey:@"facebookFromId"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    return dictionary;

}

@end
