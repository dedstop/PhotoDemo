//
//  FacebookPhotoData.h
//  
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 DEDStop LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class FacebookComments;
@class FacebookFrom;
@class FacebookLikes;
@class FacebookPlace;
@class FacebookTags;

@interface FacebookPhotoData : NSObject <NSCoding> 

@property (nonatomic, copy) NSString *backdatedTime;
@property (nonatomic, copy) NSString *backdatedTimeGranularity;
@property (nonatomic, assign) BOOL hasLargeImage;
@property (nonatomic, assign) BOOL canRemove;
@property (nonatomic, strong) FacebookComments *comments;
@property (nonatomic, copy) NSString *createdTime;
@property (nonatomic, copy) NSString *facebookPhotoDataId;
@property (nonatomic, strong) FacebookFrom *from;
@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, copy) NSNumber *likeCount;
@property (nonatomic, strong) FacebookLikes *likes;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSArray *messageTags;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *picture;
@property (nonatomic, strong) FacebookPlace *place;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, strong) FacebookTags *tags;
@property (nonatomic, copy) NSString *updatedTime;
@property (nonatomic, assign) BOOL userLikes;
@property (nonatomic, copy) NSNumber *width;
@property (nonatomic, copy) NSNumber *x;
@property (nonatomic, copy) NSNumber *y;
@property (nonatomic, strong) UIImage *image;
+ (FacebookPhotoData *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
