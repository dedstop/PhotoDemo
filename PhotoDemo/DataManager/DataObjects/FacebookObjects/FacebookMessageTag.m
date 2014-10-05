//
//  FacebookMessageTags.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "FacebookMessageTag.h"

@implementation FacebookMessageTag

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.length forKey:@"length"];
    [encoder encodeObject:self.messageTag forKey:@"id"];
    [encoder encodeObject:self.offset forKey:@"offset"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.type forKey:@"type"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [super init])) {
        self.length = [decoder decodeObjectForKey:@"length"];
        self.messageTag = [decoder decodeObjectForKey:@"id"];
        self.offset = [decoder decodeObjectForKey:@"offset"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.type = [decoder decodeObjectForKey:@"type"];
    }
    return self;
}

+ (FacebookMessageTag *)instanceFromDictionary:(NSDictionary *)aDictionary
{
    
    FacebookMessageTag *instance = [[FacebookMessageTag alloc] init];
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
        [self setValue:value forKey:@"messageTag"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    
    if (self.length) {
        [dictionary setObject:self.length forKey:@"length"];
    }
    
    if (self.messageTag) {
        [dictionary setObject:self.messageTag forKey:@"id"];
    }
    if (self.offset) {
        [dictionary setObject:self.offset forKey:@"offset"];
    }
    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }
    if (self.type) {
        [dictionary setObject:self.type forKey:@"type"];
    }
    
    return dictionary;
    
}

@end
