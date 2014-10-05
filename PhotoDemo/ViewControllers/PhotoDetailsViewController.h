//
//  PhotoDetailsViewController.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "BaseTableViewController.h"
#import "FacebookPhotoData.h"
#import "DataManager.h"

@interface PhotoDetailsViewController : BaseTableViewController
@property (strong, nonatomic) FacebookPhotoData *facebookPhotoData;
@end
