//
//  BaseCollectionViewController.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/3/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "BaseCollectionViewController.h"
//#import "BaseNavigationController.h"
//#import <Parse/Parse.h>
@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

#pragma mark - Notifications
- (void)didFinishLogIn
{
    [super didFinishLogIn];
}

- (void)didFinishLogOut
{
    [super didFinishLogOut];
}

#pragma mark - UICollectionViewFlowLayoutDelegate
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

#pragma mark - UICollectionView DataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"default" forIndexPath:indexPath];
    
    return cell;
}

@end
