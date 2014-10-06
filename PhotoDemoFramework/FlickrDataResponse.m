//
//  FlickrData.m
//  
//
//  Created by Edward Kim on 10/6/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FlickrDataResponse.h"

#import "FlickrDataPhotos.h"

@implementation FlickrDataResponse

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.photos forKey:@"photos"];
    [encoder encodeObject:self.stat forKey:@"stat"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.photos = [decoder decodeObjectForKey:@"photos"];
        self.stat = [decoder decodeObjectForKey:@"stat"];
    }
    return self;
}

+ (FlickrDataResponse *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FlickrDataResponse *instance = [[FlickrDataResponse alloc] init];
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

    if ([key isEqualToString:@"photos"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.photos = [FlickrDataPhotos instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.photos) {
        [dictionary setObject:self.photos forKey:@"photos"];
    }

    if (self.stat) {
        [dictionary setObject:self.stat forKey:@"stat"];
    }

    return dictionary;

}

@end
