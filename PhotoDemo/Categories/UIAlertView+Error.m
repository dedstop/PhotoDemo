//
//  UIAlertView+Error.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "UIAlertView+Error.h"

@implementation UIAlertView (Error)
#pragma mark - Common
- (void)showErrorWithMessage:(NSString*)message
{
    [[self initWithTitle:@"PhotoDemo" message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

- (void)showError:(NSError*)error
{
    [self showErrorWithMessage:error.localizedDescription];
}

- (void)showFacebookError:(NSError*)error
{
    NSString *errorString = [error userInfo][@"error"];
    if (!errorString) {
        NSDictionary *fbResponse = [[error userInfo] objectForKey:@"com.facebook.sdk:ParsedJSONResponseKey"];
        if (fbResponse) {
            NSDictionary *body = [fbResponse objectForKey:@"body"];
            NSDictionary *fbError = [body objectForKey:@"error"];
            errorString = [fbError objectForKey:@"message"];
        }
    }
    NSLog(@"%@",errorString);
    [self showErrorWithMessage:errorString];
}

#pragma mark - Login/Logout
- (void)showInvalidUsernameOrPassword
{
    [self showErrorWithMessage:@"Sorry, we do not recognize the user name or password."];
}

- (void)showSuccessfulLogOut
{
    [self showErrorWithMessage:@"You have been successfully logged out."];
}

- (void)showErrorLogOut
{
    [self showErrorWithMessage:@"There was an error with your facebook session so we have logged you out. Please log in again."];
}

- (void)showPasswordReset
{
    [self showErrorWithMessage:@"Check your email to complete resetting your password."];
}


@end
