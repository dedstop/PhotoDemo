//
//  DataManager.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "DataManager.h"

#import "UIAlertView+Error.h"

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@implementation DataManager

+ (id)sharedInstance
{
    // structure used to test whether the block has completed or not
    static dispatch_once_t p = 0;
    
    // initialize sharedObject as nil (first call only)
    __strong static id _sharedObject = nil;
    
    // executes a block object once and only once for the lifetime of an application
    dispatch_once(&p, ^{
        _sharedObject = [[self alloc] init];
    });
    
    // returns the same object each time
    return _sharedObject;
}


#pragma mark - Facebook
#pragma mark - Login
- (IBAction)logInFacebook:(id)sender
                onSuccess:(void(^)(void))onSuccess
                  onError:(void(^)(NSError *error))onError
{
    // The permissions requested from the user
    NSArray *permissionsArray = @[@"user_about_me",@"user_photos"];

    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            if (!error) {
                NSLog(@"User cancled facebook login");
                [[UIAlertView alloc] showErrorWithMessage:@"You need to log into facebok to use this app"];
            } else {
                [[UIAlertView alloc] showFacebookError:error];
            }
            onError(error);
        } else if (user.isNew) {
            PFInstallation *installation = [PFInstallation currentInstallation];
            installation[@"user"] = [PFUser currentUser];
            [installation saveInBackground];
            NSLog(@"User with facebook signed up and logged in!");
            onSuccess();
        } else {
            PFInstallation *installation = [PFInstallation currentInstallation];
            installation[@"user"] = [PFUser currentUser];
            [installation saveInBackground];
            [self verifyFacebookUser];
            NSLog(@"User with facebook logged in!");
            onSuccess();
        }
    }];
}

- (void)logoutWithError
{
    [PFUser logOut]; // Log out
    // Return to login page
    [[UIAlertView alloc] showErrorLogOut];
}

- (void)verifyFacebookUser
{
    FBRequest *request = [FBRequest requestForMe];
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // handle successful response
            
        } else if ([error.userInfo[FBErrorParsedJSONResponseKey][@"body"][@"error"][@"type"] isEqualToString:@"OAuthException"]) { // Since the request failed, we can check if it was due to an invalid session
            NSLog(@"The facebook session was invalidated");
            [self logoutWithError];
            
        } else {
            NSLog(@"Some other error: %@", error);
            [self logoutWithError];
        }
    }];
}

#pragma mark - Photos
- (void)getFacebookPhotos:(void(^)(FacebookPhotoDataResponse *response))onSuccess
                  onError:(void(^)(NSError* error))onError
{
    /* make the API call */
    [FBRequestConnection startWithGraphPath:@"/me/photos"
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              if (error) {
                                  onError(error);
                              }else{
                                  onSuccess([FacebookPhotoDataResponse instanceFromDictionary:result]);
                              }
                              
                              /* handle the result */
                          }];
}

- (void)getFacebookPhotosNext:(NSString*)nextURLString
                    onSuccess:(void(^)(FacebookPhotoDataResponse *response))onSuccess
                  onError:(void(^)(NSError* error))onError
{
    NSRange range = [nextURLString rangeOfString:@"?"];
    NSString *newString = [nextURLString substringWithRange:NSMakeRange(range.location, nextURLString.length-range.location)];
    //NSLog(@"%@",newString);
    /* make the API call */
    [FBRequestConnection startWithGraphPath:[NSString stringWithFormat:@"/me/photos%@",newString]
                                 parameters:nil
                                 HTTPMethod:@"GET"
                          completionHandler:^(
                                              FBRequestConnection *connection,
                                              id result,
                                              NSError *error
                                              ) {
                              if (error) {
                                  onError(error);
                              }else{
                                  onSuccess([FacebookPhotoDataResponse instanceFromDictionary:result]);
                              }
                              
                              /* handle the result */
                          }];
}

- (void)getFacebookPhoto:(NSURL*)url indexPath:(NSIndexPath*)indexPath
               onSuccess:(void(^)(UIImage *image, NSIndexPath*indexPath))onSuccess
                 onError:(void(^)(NSError *error))onError
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if (!error) {
            onSuccess([UIImage imageWithData:data],indexPath);
        } else {
            onError(error);
        }
    }];
}
@end
