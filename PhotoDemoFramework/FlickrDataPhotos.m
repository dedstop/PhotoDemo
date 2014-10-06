//
//  FlickrDataPhotos.m
//  
//
//  Created by Edward Kim on 10/6/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FlickrDataPhotos.h"

#import "FlickrPhoto.h"

@implementation FlickrDataPhotos

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.page forKey:@"page"];
    [encoder encodeObject:self.pages forKey:@"pages"];
    [encoder encodeObject:self.perpage forKey:@"perpage"];
    [encoder encodeObject:self.photo forKey:@"photo"];
    [encoder encodeObject:self.total forKey:@"total"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.page = [decoder decodeObjectForKey:@"page"];
        self.pages = [decoder decodeObjectForKey:@"pages"];
        self.perpage = [decoder decodeObjectForKey:@"perpage"];
        self.photo = [decoder decodeObjectForKey:@"photo"];
        self.total = [decoder decodeObjectForKey:@"total"];
    }
    return self;
}

+ (FlickrDataPhotos *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FlickrDataPhotos *instance = [[FlickrDataPhotos alloc] init];
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

    if ([key isEqualToString:@"photo"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                FlickrPhoto *populatedMember = [FlickrPhoto instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.photo = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.page) {
        [dictionary setObject:self.page forKey:@"page"];
    }

    if (self.pages) {
        [dictionary setObject:self.pages forKey:@"pages"];
    }

    if (self.perpage) {
        [dictionary setObject:self.perpage forKey:@"perpage"];
    }

    if (self.photo) {
        [dictionary setObject:self.photo forKey:@"photo"];
    }

    if (self.total) {
        [dictionary setObject:self.total forKey:@"total"];
    }

    return dictionary;

}

@end
