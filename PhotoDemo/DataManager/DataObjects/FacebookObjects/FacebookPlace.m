//
//  FacebookPlace.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookPlace.h"

#import "FacebookPlaceLocation.h"

@implementation FacebookPlace

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.facebookPlaceId forKey:@"facebookPlaceId"];
    [encoder encodeObject:self.location forKey:@"location"];
    [encoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.facebookPlaceId = [decoder decodeObjectForKey:@"facebookPlaceId"];
        self.location = [decoder decodeObjectForKey:@"location"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

+ (FacebookPlace *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookPlace *instance = [[FacebookPlace alloc] init];
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

    if ([key isEqualToString:@"location"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.location = [FacebookPlaceLocation instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"facebookPlaceId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.facebookPlaceId) {
        [dictionary setObject:self.facebookPlaceId forKey:@"facebookPlaceId"];
    }

    if (self.location) {
        [dictionary setObject:self.location forKey:@"location"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    return dictionary;

}

@end
