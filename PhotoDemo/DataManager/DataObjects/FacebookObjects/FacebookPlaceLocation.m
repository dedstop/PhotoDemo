//
//  FacebookPlaceLocation.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookPlaceLocation.h"

@implementation FacebookPlaceLocation

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.city forKey:@"city"];
    [encoder encodeObject:self.country forKey:@"country"];
    [encoder encodeObject:self.latitude forKey:@"latitude"];
    [encoder encodeObject:self.longitude forKey:@"longitude"];
    [encoder encodeObject:self.state forKey:@"state"];
    [encoder encodeObject:self.street forKey:@"street"];
    [encoder encodeObject:self.zip forKey:@"zip"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.city = [decoder decodeObjectForKey:@"city"];
        self.country = [decoder decodeObjectForKey:@"country"];
        self.latitude = [decoder decodeObjectForKey:@"latitude"];
        self.longitude = [decoder decodeObjectForKey:@"longitude"];
        self.state = [decoder decodeObjectForKey:@"state"];
        self.street = [decoder decodeObjectForKey:@"street"];
        self.zip = [decoder decodeObjectForKey:@"zip"];
    }
    return self;
}

+ (FacebookPlaceLocation *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookPlaceLocation *instance = [[FacebookPlaceLocation alloc] init];
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

- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.city) {
        [dictionary setObject:self.city forKey:@"city"];
    }

    if (self.country) {
        [dictionary setObject:self.country forKey:@"country"];
    }

    if (self.latitude) {
        [dictionary setObject:self.latitude forKey:@"latitude"];
    }

    if (self.longitude) {
        [dictionary setObject:self.longitude forKey:@"longitude"];
    }

    if (self.state) {
        [dictionary setObject:self.state forKey:@"state"];
    }

    if (self.street) {
        [dictionary setObject:self.street forKey:@"street"];
    }

    if (self.zip) {
        [dictionary setObject:self.zip forKey:@"zip"];
    }

    return dictionary;

}

@end
