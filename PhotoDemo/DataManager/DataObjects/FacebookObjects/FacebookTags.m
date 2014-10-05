//
//  FacebookTags.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookTags.h"

#import "FacebookPhotoData.h"
#import "FacebookPaging.h"

@implementation FacebookTags

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.data forKey:@"data"];
    [encoder encodeObject:self.paging forKey:@"paging"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.data = [decoder decodeObjectForKey:@"data"];
        self.paging = [decoder decodeObjectForKey:@"paging"];
    }
    return self;
}

+ (FacebookTags *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookTags *instance = [[FacebookTags alloc] init];
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

    if ([key isEqualToString:@"data"]) {

        if ([value isKindOfClass:[NSArray class]]) {

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                FacebookPhotoData *populatedMember = [FacebookPhotoData instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.data = myMembers;

        }

    } else if ([key isEqualToString:@"paging"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.paging = [FacebookPaging instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.data) {
        [dictionary setObject:self.data forKey:@"data"];
    }

    if (self.paging) {
        [dictionary setObject:self.paging forKey:@"paging"];
    }

    return dictionary;

}

@end
