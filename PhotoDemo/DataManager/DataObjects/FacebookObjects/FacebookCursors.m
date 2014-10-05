//
//  FacebookCursors.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookCursors.h"

@implementation FacebookCursors

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.after forKey:@"after"];
    [encoder encodeObject:self.before forKey:@"before"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.after = [decoder decodeObjectForKey:@"after"];
        self.before = [decoder decodeObjectForKey:@"before"];
    }
    return self;
}

+ (FacebookCursors *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookCursors *instance = [[FacebookCursors alloc] init];
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

    if (self.after) {
        [dictionary setObject:self.after forKey:@"after"];
    }

    if (self.before) {
        [dictionary setObject:self.before forKey:@"before"];
    }

    return dictionary;

}

@end
