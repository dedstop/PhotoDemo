//
//  BaseViewController.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/3/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "BaseViewController.h"

//#import "BaseNavigationController.h"
//#import "LoginViewController.h"
//#import <Parse/Parse.h>
#import "Keys.h"

@interface BaseViewController ()
@property int indicatorCount;
@end

@implementation BaseViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_DID_FINISH_LOG_IN object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_DID_FINISH_LOG_OUT object:nil];
}

#pragma mark - Life Cycle
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //Check if user is already logged in else show Login
//#warning TODO Move
//    if (![PFUser currentUser]&&![self isKindOfClass:[LoginViewController class]]) {
//        [(BaseNavigationController*)self.navigationController navigateToLogin];
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Watch changes for text size in accessibility
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(contentSizeCategoryChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishLogIn) name:NOTIFICATION_DID_FINISH_LOG_IN object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishLogOut) name:NOTIFICATION_DID_FINISH_LOG_OUT object:nil];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)home:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)logOut:(id)sender
{

}

#pragma mark - ActivityIndicator
- (void)increamentActivty
{
    self.indicatorCount++;
    [self.activityIndicator startAnimating];
}

- (void)decrementActivity
{
    self.indicatorCount--;
    if (self.indicatorCount <= 0) {
        [self setIndicatorCount:0];
        [self.activityIndicator stopAnimating];
    }
}

- (void)stopActivity
{
    [self setIndicatorCount:0];
    [self.activityIndicator stopAnimating];
}

#pragma mark - Content Notification
- (void)contentSizeCategoryChanged:(NSNotification*)notification
{
    
}

- (void)didFinishLogIn
{
    
}

- (void)didFinishLogOut
{
    
}

@end
