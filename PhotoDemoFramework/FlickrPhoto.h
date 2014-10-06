//
//  FlickrPhoto.h
//  
//
//  Created by Edward Kim on 10/6/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlickrPhoto : NSObject <NSCoding> 

@property (nonatomic, copy) NSNumber *farm;
@property (nonatomic, copy) NSNumber *isfamily;
@property (nonatomic, copy) NSNumber *isfriend;
@property (nonatomic, copy) NSNumber *ispublic;
@property (nonatomic, copy) NSString *owner;
@property (nonatomic, copy) NSString *flickrPhotoId;
@property (nonatomic, copy) NSString *secret;
@property (nonatomic, copy) NSString *server;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BOOL hasLargeImage;

+ (FlickrPhoto *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
- (NSDictionary *)dictionaryRepresentation;

@end
