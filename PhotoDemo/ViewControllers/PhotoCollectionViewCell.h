//
//  PhotoCollectionViewCell.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "BaseCollectionViewCell.h"

@interface PhotoCollectionViewCell : BaseCollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (void)applyStyle;
@end
