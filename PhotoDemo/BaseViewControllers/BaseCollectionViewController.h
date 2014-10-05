//
//  BaseCollectionViewController.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/3/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseCollectionViewController : BaseViewController <UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
