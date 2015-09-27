//
//  ImageCell.m
//  微博图文混排
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (void)awakeFromNib {
    self.iconImageView.layer.cornerRadius = 15;
    self.iconImageView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
