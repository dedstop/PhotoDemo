//
//  FacebookPhotoData.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookPhotoData.h"

#import "FacebookComments.h"
#import "FacebookFrom.h"
#import "FacebookPhoto.h"
#import "FacebookLikes.h"
#import "FacebookMessageTag.h"
#import "FacebookPlace.h"
#import "FacebookTags.h"

@implementation FacebookPhotoData

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.backdatedTime forKey:@"backdatedTime"];
    [encoder encodeObject:self.backdatedTimeGranularity forKey:@"backdatedTimeGranularity"];
    [encoder encodeObject:[NSNumber numberWithBool:self.canRemove] forKey:@"canRemove"];
    [encoder encodeObject:self.comments forKey:@"comments"];
    [encoder encodeObject:self.createdTime forKey:@"createdTime"];
    [encoder encodeObject:self.facebookPhotoDataId forKey:@"facebookPhotoDataId"];
    [encoder encodeObject:self.from forKey:@"from"];
    [encoder encodeObject:self.height forKey:@"height"];
    [encoder encodeObject:self.icon forKey:@"icon"];
    [encoder encodeObject:self.images forKey:@"images"];
    [encoder encodeObject:self.likeCount forKey:@"likeCount"];
    [encoder encodeObject:self.likes forKey:@"likes"];
    [encoder encodeObject:self.link forKey:@"link"];
    [encoder encodeObject:self.message forKey:@"message"];
    [encoder encodeObject:self.messageTags forKey:@"messageTags"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.picture forKey:@"picture"];
    [encoder encodeObject:self.place forKey:@"place"];
    [encoder encodeObject:self.source forKey:@"source"];
    [encoder encodeObject:self.tags forKey:@"tags"];
    [encoder encodeObject:self.updatedTime forKey:@"updatedTime"];
    [encoder encodeObject:[NSNumber numberWithBool:self.userLikes] forKey:@"userLikes"];
    [encoder encodeObject:self.width forKey:@"width"];
    [encoder encodeObject:self.x forKey:@"x"];
    [encoder encodeObject:self.y forKey:@"y"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.backdatedTime = [decoder decodeObjectForKey:@"backdatedTime"];
        self.backdatedTimeGranularity = [decoder decodeObjectForKey:@"backdatedTimeGranularity"];
        self.canRemove = [(NSNumber *)[decoder decodeObjectForKey:@"canRemove"] boolValue];
        self.comments = [decoder decodeObjectForKey:@"comments"];
        self.createdTime = [decoder decodeObjectForKey:@"createdTime"];
        self.facebookPhotoDataId = [decoder decodeObjectForKey:@"facebookPhotoDataId"];
        self.from = [decoder decodeObjectForKey:@"from"];
        self.height = [decoder decodeObjectForKey:@"height"];
        self.icon = [decoder decodeObjectForKey:@"icon"];
        self.images = [decoder decodeObjectForKey:@"images"];
        self.likeCount = [decoder decodeObjectForKey:@"likeCount"];
        self.likes = [decoder decodeObjectForKey:@"likes"];
        self.link = [decoder decodeObjectForKey:@"link"];
        self.message = [decoder decodeObjectForKey:@"message"];
        self.messageTags = [decoder decodeObjectForKey:@"messageTags"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.picture = [decoder decodeObjectForKey:@"picture"];
        self.place = [decoder decodeObjectForKey:@"place"];
        self.source = [decoder decodeObjectForKey:@"source"];
        self.tags = [decoder decodeObjectForKey:@"tags"];
        self.updatedTime = [decoder decodeObjectForKey:@"updatedTime"];
        self.userLikes = [(NSNumber *)[decoder decodeObjectForKey:@"userLikes"] boolValue];
        self.width = [decoder decodeObjectForKey:@"width"];
        self.x = [decoder decodeObjectForKey:@"x"];
        self.y = [decoder decodeObjectForKey:@"y"];
    }
    return self;
}

+ (FacebookPhotoData *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookPhotoData *instance = [[FacebookPhotoData alloc] init];
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

    if ([key isEqualToString:@"comments"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.comments = [FacebookComments instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"from"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.from = [FacebookFrom instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"images"]) {

        if ([value isKindOfClass:[NSArray class]]) {

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                FacebookPhoto *populatedMember = [FacebookPhoto instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.images = myMembers;

        }

    } else if ([key isEqualToString:@"likes"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.likes = [FacebookLikes instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"message_tags"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                FacebookMessageTag *populatedMember = [FacebookMessageTag instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.messageTags = myMembers;

        }

    } else if ([key isEqualToString:@"place"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.place = [FacebookPlace instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"tags"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.tags = [FacebookTags instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

    if ([key isEqualToString:@"backdated_time"]) {
        [self setValue:value forKey:@"backdatedTime"];
    } else if ([key isEqualToString:@"backdated_time_granularity"]) {
        [self setValue:value forKey:@"backdatedTimeGranularity"];
    } else if ([key isEqualToString:@"can_remove"]) {
        [self setValue:value forKey:@"canRemove"];
    } else if ([key isEqualToString:@"created_time"]) {
        [self setValue:value forKey:@"createdTime"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"facebookPhotoDataId"];
    } else if ([key isEqualToString:@"like_count"]) {
        [self setValue:value forKey:@"likeCount"];
    } else if ([key isEqualToString:@"message_tags"]) {
        [self setValue:value forKey:@"messageTags"];
    } else if ([key isEqualToString:@"updated_time"]) {
        [self setValue:value forKey:@"updatedTime"];
    } else if ([key isEqualToString:@"user_likes"]) {
        [self setValue:value forKey:@"userLikes"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.backdatedTime) {
        [dictionary setObject:self.backdatedTime forKey:@"backdatedTime"];
    }

    if (self.backdatedTimeGranularity) {
        [dictionary setObject:self.backdatedTimeGranularity forKey:@"backdatedTimeGranularity"];
    }

    [dictionary setObject:[NSNumber numberWithBool:self.canRemove] forKey:@"canRemove"];

    if (self.comments) {
        [dictionary setObject:self.comments forKey:@"comments"];
    }

    if (self.createdTime) {
        [dictionary setObject:self.createdTime forKey:@"createdTime"];
    }

    if (self.facebookPhotoDataId) {
        [dictionary setObject:self.facebookPhotoDataId forKey:@"facebookPhotoDataId"];
    }

    if (self.from) {
        [dictionary setObject:self.from forKey:@"from"];
    }

    if (self.height) {
        [dictionary setObject:self.height forKey:@"height"];
    }

    if (self.icon) {
        [dictionary setObject:self.icon forKey:@"icon"];
    }

    if (self.images) {
        [dictionary setObject:self.images forKey:@"images"];
    }

    if (self.likeCount) {
        [dictionary setObject:self.likeCount forKey:@"likeCount"];
    }

    if (self.likes) {
        [dictionary setObject:self.likes forKey:@"likes"];
    }

    if (self.link) {
        [dictionary setObject:self.link forKey:@"link"];
    }

    if (self.message) {
        [dictionary setObject:self.message forKey:@"message"];
    }

    if (self.messageTags) {
        [dictionary setObject:self.messageTags forKey:@"messageTags"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    if (self.picture) {
        [dictionary setObject:self.picture forKey:@"picture"];
    }

    if (self.place) {
        [dictionary setObject:self.place forKey:@"place"];
    }

    if (self.source) {
        [dictionary setObject:self.source forKey:@"source"];
    }

    if (self.tags) {
        [dictionary setObject:self.tags forKey:@"tags"];
    }

    if (self.updatedTime) {
        [dictionary setObject:self.updatedTime forKey:@"updatedTime"];
    }

    [dictionary setObject:[NSNumber numberWithBool:self.userLikes] forKey:@"userLikes"];

    if (self.width) {
        [dictionary setObject:self.width forKey:@"width"];
    }

    if (self.x) {
        [dictionary setObject:self.x forKey:@"x"];
    }

    if (self.y) {
        [dictionary setObject:self.y forKey:@"y"];
    }

    return dictionary;

}

@end
