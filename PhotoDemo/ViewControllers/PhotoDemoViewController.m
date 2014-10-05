
//
//  PhotoDemoViewController.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "PhotoDemoViewController.h"

#import "PhotoDetailsViewController.h"
#import "BaseNavigationController.h"
#import "PhotoCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "LoginViewController.h"
#import "FacebookPhotoData.h"
#import "FacebookPaging.h"
#import "DataManager.h"
#import <Parse/Parse.h>
#import "Keys.h"

@interface PhotoDemoViewController ()
@property (strong, nonatomic) DataManager *dataManger;
@property (strong, nonatomic) FacebookPhotoDataResponse *facebookData;
@property (strong, nonatomic) NSMutableDictionary *images;
@end

@implementation PhotoDemoViewController

#pragma mark - Life Cycle
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (![PFUser currentUser]&&![self isKindOfClass:[LoginViewController class]]) {
        [(BaseNavigationController*)self.navigationController navigateToLogin];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dataManger = [DataManager sharedInstance];
    
    if ([PFUser currentUser]) {
        __weak typeof(self) weakSelf = self;
        [self increamentActivty];
        [self.dataManger getFacebookPhotos:^(FacebookPhotoDataResponse* response) {
            NSLog(@"Returned response");
            [weakSelf decrementActivity];
            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]
                                            initWithKey:@"createdTime" ascending:YES selector:@selector(localizedStandardCompare:)];
            response.data = [response.data sortedArrayUsingDescriptors:@[descriptor]];
            [weakSelf setFacebookData:response];
            [weakSelf.collectionView reloadData];
        } onError:^(NSError *error) {
            [weakSelf decrementActivity];
        }];
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Details"]) {
        UICollectionViewCell *cell = sender;
        NSIndexPath *path = [self.collectionView indexPathForCell:cell];
        FacebookPhotoData *data = self.facebookData.data[path.row];
        PhotoDetailsViewController *controller = segue.destinationViewController;
        [controller setFacebookPhotoData:data];
    }
}

#pragma mark - Action
- (IBAction)logOut:(id)sender
{
    [super logOut:sender];
    [PFUser logOut];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_DID_FINISH_LOG_OUT object:nil];
    [(BaseNavigationController*)self.navigationController navigateToLogin];
}


#pragma mark - Notifications
- (void)didFinishLogIn
{
    [super didFinishLogIn];
    if (!self.facebookData) {
        __weak typeof(self) weakSelf = self;
        [self increamentActivty];
        [self.dataManger getFacebookPhotos:^(FacebookPhotoDataResponse* response) {
            NSLog(@"Returned response");
            [weakSelf decrementActivity];
            NSSortDescriptor *descriptor = [[NSSortDescriptor alloc]
                                            initWithKey:@"createdTime" ascending:YES selector:@selector(localizedStandardCompare:)];
            response.data = [response.data sortedArrayUsingDescriptors:@[descriptor]];
            [weakSelf setFacebookData:response];
            [weakSelf.collectionView reloadData];
        } onError:^(NSError *error) {
            [weakSelf decrementActivity];
        }];
    }
}

- (void)didFinishLogOut
{
    [super didFinishLogOut];
    self.facebookData = nil;
    [self.collectionView reloadData];
}

//- (void)updateCellWithInfo:(NSDictionary*)info
//{
//    PhotoCollectionViewCell *cell = (PhotoCollectionViewCell*)[self.collectionView cellForItemAtIndexPath:indexPath];
//    [cell.imageView setImage:image];
//}

#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.facebookData.data count];
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"default" forIndexPath:indexPath];
    FacebookPhotoData *data = self.facebookData.data[indexPath.row];

    //Check if data contains an image
    if (!data.image) {
        //Clear a dequed cells image view since it may have retain a previous ones image.
        [cell.imageView setImage:nil];
        __weak typeof(self) weakSelf = self;
        __weak typeof(FacebookPhotoDataResponse*) weakData = self.facebookData;
        [self increamentActivty];
        
        [self.dataManger getFacebookPhoto:[NSURL URLWithString:data.picture] indexPath:indexPath onSuccess:^(UIImage *image, NSIndexPath *indexPath) {
            [weakSelf decrementActivity];
            if(indexPath){
                //Update data with image
                [weakData.data[indexPath.row] setImage:image];
                //Reload row to show image
                
                [weakSelf.collectionView reloadItemsAtIndexPaths:@[indexPath]];
            }
            
        } onError:^(NSError *error) {
            [weakSelf decrementActivity];
        }];

    }else{
        [cell.imageView setImage:data.image];
    }
    
    //At the end of a tableview check for more data and load
    if (indexPath.row == [self.facebookData.data count] - 1 && self.facebookData.paging.next && self.facebookData){
        __weak typeof(self) weakSelf = self;
        __weak typeof(FacebookPhotoDataResponse*) weakData = self.facebookData;
        [self increamentActivty];
        [self.dataManger getFacebookPhotosNext:[self.facebookData.paging next] onSuccess:^(FacebookPhotoDataResponse *response) {
            [weakSelf decrementActivity];
            //Create an array of new indexPaths
            NSMutableArray *marray = [[NSMutableArray alloc] init];
            for (NSUInteger i = 0; i<[response.data count]; i++) {
                [marray addObject:[NSIndexPath indexPathForItem:[weakData.data count]+i inSection:0]];
            }
            //Add new data to data array
            weakData.data = [weakData.data arrayByAddingObjectsFromArray:response.data];
            //Replace data paging with new paging
            weakData.paging = response.paging;
            //Insert the new data into the colletion view
            [weakSelf.collectionView insertItemsAtIndexPaths:marray];
        } onError:^(NSError *error) {
            [weakSelf decrementActivity];
        }];
    }
    
    [cell applyStyle];

    return cell;
}

@end
