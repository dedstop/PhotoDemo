//
//  FacebookPaging.m
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import "FacebookPaging.h"

#import "FacebookCursors.h"

@implementation FacebookPaging

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.cursors forKey:@"cursors"];
    [encoder encodeObject:self.next forKey:@"next"];
    [encoder encodeObject:self.previous forKey:@"previous"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.cursors = [decoder decodeObjectForKey:@"cursors"];
        self.next = [decoder decodeObjectForKey:@"next"];
        self.previous = [decoder decodeObjectForKey:@"previous"];
    }
    return self;
}

+ (FacebookPaging *)instanceFromDictionary:(NSDictionary *)aDictionary
{

    FacebookPaging *instance = [[FacebookPaging alloc] init];
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

    if ([key isEqualToString:@"cursors"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.cursors = [FacebookCursors instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.cursors) {
        [dictionary setObject:self.cursors forKey:@"cursors"];
    }

    if (self.next) {
        [dictionary setObject:self.next forKey:@"next"];
    }

    if (self.previous) {
        [dictionary setObject:self.previous forKey:@"previous"];
    }

    return dictionary;

}

@end
