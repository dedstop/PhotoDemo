//
//  LoginViewController.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "LoginViewController.h"
#import "DataManager.h"
#import "Keys.h"

@interface LoginViewController ()
@property (strong, nonatomic) DataManager *dataManger;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@end

@implementation LoginViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataManger = [DataManager sharedInstance];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions
- (IBAction)loginWithFacebook:(id)sender
{
    __weak typeof(self) weakSelf = self;
    [self increamentActivty];
    [self.dataManger logInFacebook:sender onSuccess:^{
        [weakSelf decrementActivity];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DID_FINISH_LOG_IN object:nil];
        [weakSelf dismiss:nil];
    } onError:^(NSError *error) {
        [weakSelf decrementActivity];
    }];
}

#pragma mark - Content Notification
- (void)contentSizeCategoryChanged:(NSNotification*)notification
{
    [super contentSizeCategoryChanged:notification];
    [self.headerLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
}


@end
