//
//  UIAlertView+Error.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Error)
#pragma mark - Common
- (void)showErrorWithMessage:(NSString*)message;
- (void)showError:(NSError*)error;
- (void)showFacebookError:(NSError*)error;
#pragma mark - Login/Logout
- (void)showInvalidUsernameOrPassword;
- (void)showSuccessfulLogOut;
- (void)showErrorLogOut;
- (void)showPasswordReset;
@end
