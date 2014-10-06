//
//  DataManager.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "FacebookPhotoDataResponse.h"
#import "FlickrDataResponse.h"

#import "FlickrPhoto.h"
#import "FlickrKit.h"

@interface DataManager : NSObject
#pragma mark - shared Instance
+ (id)sharedInstance;
#pragma mark - Facebook
- (IBAction)logInFacebook:(id)sender
                onSuccess:(void(^)(void))onSuccess
                  onError:(void(^)(NSError *error))onError;
- (void)getFacebookPhotos:(void(^)(FacebookPhotoDataResponse *response))onSuccess
                  onError:(void(^)(NSError* error))onError;
- (void)getFacebookPhotosNext:(NSString*)nextURLString
                    onSuccess:(void(^)(FacebookPhotoDataResponse *response))onSuccess
                      onError:(void(^)(NSError* error))onError;
#pragma mark - Flickr
- (void)getFlickrInterestingPhotos:(void(^)(FlickrDataResponse *response))onSuccess
                           onError:(void(^)(NSError* error))onError;

- (NSURL*)imageURL:(FlickrPhoto*)photo withSize:(FKPhotoSize)photoSize;
#pragma mark - All
- (void)getPhoto:(NSURL*)url indexPath:(NSIndexPath*)indexPath
       onSuccess:(void(^)(UIImage *image, NSIndexPath*indexPath))onSuccess
         onError:(void(^)(NSError *error))onError;
@end
