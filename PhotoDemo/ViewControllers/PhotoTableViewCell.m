//
//  PhotoTableViewCell.m
//  PhotoDemo
//
//  Created by Edward Kim on 10/4/14.
//  Copyright (c) 2014 Edward Kim. All rights reserved.
//

#import "PhotoTableViewCell.h"

@implementation PhotoTableViewCell

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)updateStyle
{
    [self.headerLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline]];
    [self.captionLabel setFont:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1]];
}
@end
