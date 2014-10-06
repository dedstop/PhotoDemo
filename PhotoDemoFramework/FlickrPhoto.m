//
//  FlickrPhoto.m
//  
//
//  Created by Edward Kim on 10/6/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FlickrPhoto.h"
#import "FlickrKit.h"

@implementation FlickrPhoto

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.farm forKey:@"farm"];
    [encoder encodeObject:self.isfamily forKey:@"isfamily"];
    [encoder encodeObject:self.isfriend forKey:@"isfriend"];
    [encoder encodeObject:self.ispublic forKey:@"ispublic"];
    [encoder encodeObject:self.owner forKey:@"owner"];
    [encoder encodeObject:self.flickrPhotoId forKey:@"flickrPhotoId"];
    [encoder encodeObject:self.secret forKey:@"secret"];
    [encoder encodeObject:self.server forKey:@"server"];
    [encoder encodeObject:self.title forKey:@"title"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.farm = [decoder decodeObjectForKey:@"farm"];
        self.isfamily = [decoder decodeObjectForKey:@"isfamily"];
        self.isfriend = [decoder decodeObjectForKey:@"isfriend"];
        self.ispublic = [decoder decodeObjectForKey:@"ispublic"];
        self.owner = [decoder decodeObjectForKey:@"owner"];
        self.flickrPhotoId = [decoder decodeObjectForKey:@"flickrPhotoId"];
        self.secret = [decoder decodeObjectForKey:@"secret"];
        self.server = [decoder decodeObjectForKey:@"server"];
        self.title = [decoder decodeObjectForKey:@"title"];
    }
    return self;
}

+ (FlickrPhoto *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FlickrPhoto *instance = [[FlickrPhoto alloc] init];
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
        [self setValue:value forKey:@"flickrPhotoId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.farm) {
        [dictionary setObject:self.farm forKey:@"farm"];
    }

    if (self.isfamily) {
        [dictionary setObject:self.isfamily forKey:@"isfamily"];
    }

    if (self.isfriend) {
        [dictionary setObject:self.isfriend forKey:@"isfriend"];
    }

    if (self.ispublic) {
        [dictionary setObject:self.ispublic forKey:@"ispublic"];
    }

    if (self.owner) {
        [dictionary setObject:self.owner forKey:@"owner"];
    }

    if (self.flickrPhotoId) {
        [dictionary setObject:self.flickrPhotoId forKey:@"flickrPhotoId"];
    }

    if (self.secret) {
        [dictionary setObject:self.secret forKey:@"secret"];
    }

    if (self.server) {
        [dictionary setObject:self.server forKey:@"server"];
    }

    if (self.title) {
        [dictionary setObject:self.title forKey:@"title"];
    }

    return dictionary;

}

@end
