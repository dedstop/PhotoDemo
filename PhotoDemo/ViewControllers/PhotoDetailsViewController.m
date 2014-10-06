//
//  PhotoDetailsViewController.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import "PhotoTableViewCell.h"
#import "FacebookLikes.h"
#import <Parse/Parse.h>

@interface PhotoDetailsViewController ()
@property (strong, nonatomic) NSArray *identifiers;
@end

@implementation PhotoDetailsViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.identifiers = @[@"image",@"header",@"detail",@"detail"];
    
    //Check if larger image exists else get new larger image to replace.
    if ([PFUser currentUser]){
        if (!self.facebookPhotoData.hasLargeImage) {
            __weak typeof(self) weakSelf = self;
            __weak typeof(FacebookPhotoData*) weakData = self.facebookPhotoData;
            
            [[DataManager sharedInstance] getPhoto:[NSURL URLWithString:self.facebookPhotoData.source] indexPath:nil onSuccess:^(UIImage *image, NSIndexPath *indexPath) {
                [weakData setHasLargeImage:YES];
                [weakData setImage:image];
                [weakSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            } onError:^(NSError *error) {
                
            }];
        }
    }else{
        if (!self.flickrPhoto.hasLargeImage) {
            __weak typeof(self) weakSelf = self;
            __weak typeof(FlickrPhoto*) weakData = self.flickrPhoto;
            
            [[DataManager sharedInstance] getPhoto:[[DataManager sharedInstance] imageURL:self.flickrPhoto withSize:FKPhotoSizeMedium800] indexPath:nil onSuccess:^(UIImage *image, NSIndexPath *indexPath) {
                [weakData setHasLargeImage:YES];
                [weakData setImage:image];
                [weakSelf.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];
            } onError:^(NSError *error) {
                
            }];
        }
    }

    
    
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
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

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.identifiers count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifiers[indexPath.row]];
    
    switch (indexPath.row) {
        case 1:{
            
            [cell.headerLabel setText:[PFUser currentUser]?self.facebookPhotoData.name:self.flickrPhoto.title];
            break;
        }
        case 2:{
            //Formate Date
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
    
            [df setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZ"];
            NSDate *date = [df dateFromString:[self.facebookPhotoData.updatedTime stringByReplacingOccurrencesOfString:@"T" withString:@" "]];
            [df setDateFormat:@"eee MMM dd, yyyy hh:mma"];
            
            NSString *dateStr = [df stringFromDate:date];
            [cell.captionLabel setText:dateStr];
            break;
        }
        case 3:{
            NSInteger likeCount = [self.facebookPhotoData.likes.data count];
            
            if (likeCount>0) {
                NSMutableString *mutablString = [NSMutableString stringWithFormat:@"Likes %ld\n",likeCount];
                for (int i = 0; i<[self.facebookPhotoData.likes.data count]; i++) {
                    if (i == 0) {
                        [mutablString appendString:[self.facebookPhotoData.likes.data[i] name]];
                        
                    }else{
                        [mutablString appendFormat:@", %@",[self.facebookPhotoData.likes.data[i] name]];
                    }
                }
                [cell.captionLabel setText:mutablString];
            }else{
                [cell.captionLabel setText:@""];
            }
            break;
        }
        default:{
            //Loads small image first while call to get larger image is processing
            [cell.photoImageView setImage:[PFUser currentUser]?self.facebookPhotoData.image:self.flickrPhoto.image];
            break;
        }
    }
    //This sets the font for the labels based on accessibility
    [cell updateStyle];
    return cell;
}

@end
