//
//  FacebookPhoto.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookPhoto.h"

@implementation FacebookPhoto

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.height forKey:@"height"];
    [encoder encodeObject:self.source forKey:@"source"];
    [encoder encodeObject:self.width forKey:@"width"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.height = [decoder decodeObjectForKey:@"height"];
        self.source = [decoder decodeObjectForKey:@"source"];
        self.width = [decoder decodeObjectForKey:@"width"];
    }
    return self;
}

+ (FacebookPhoto *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookPhoto *instance = [[FacebookPhoto alloc] init];
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

    if (self.height) {
        [dictionary setObject:self.height forKey:@"height"];
    }

    if (self.source) {
        [dictionary setObject:self.source forKey:@"source"];
    }

    if (self.width) {
        [dictionary setObject:self.width forKey:@"width"];
    }

    return dictionary;

}

@end
