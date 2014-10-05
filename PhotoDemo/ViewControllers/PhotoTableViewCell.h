//
//  PhotoTableViewCell.h
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface PhotoTableViewCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UILabel *captionLabel;

- (void)updateStyle;
@end
