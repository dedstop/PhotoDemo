//
//  PhotoCollectionViewCell.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "FacebookPhotoData.h"

@implementation PhotoCollectionViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)applyStyle
{
    [self.layer setCornerRadius:15];
    [self.layer setBorderColor:[UIColor darkGrayColor].CGColor];
    [self.layer setBorderWidth:1];
}

@end
