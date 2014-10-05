//
//  BaseViewController.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/3/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
#pragma mark - Navigation
- (IBAction)back:(id)sender;
- (IBAction)home:(id)sender;
- (IBAction)dismiss:(id)sender;
- (IBAction)logOut:(id)sender;
#pragma mark - ActivityIndicator
- (void)increamentActivty;
- (void)decrementActivity;
- (void)stopActivity;

#pragma mark - Content Notification
- (void)contentSizeCategoryChanged:(NSNotification*)notification;
- (void)didFinishLogIn;
- (void)didFinishLogOut;
@end
