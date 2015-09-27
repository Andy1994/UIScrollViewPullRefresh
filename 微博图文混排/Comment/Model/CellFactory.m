//
//  CellFactory.m
//  微博图文混排
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "CellFactory.h"
#import "TextCell.h"
#import "ImageCell.h"

@implementation CellFactory

+ (UITableViewCell *)tableView:(UITableView *)tableView withModel:(WeiBoModel *)model
{
    if(model.picture == nil)
    {
        TextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell"];
        [cell.iconImageView setImage:[UIImage imageNamed:model.icon]];
        cell.nameLabel.text = model.name;
        cell.myTextLabel.text = model.text;
        return cell;
    }
    else
    {
        ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        [cell.iconImageView setImage:[UIImage imageNamed:model.icon]];
        cell.nameLabel.text = model.name;
        cell.myTextLabel.text = model.text;
        [cell.myImageView setImage:[UIImage imageNamed:model.picture]];
        return cell;
    }
}

+ (CGFloat)cellHeight:(WeiBoModel *)model withTableView:(UITableView *)tableView
{
    if(model.picture == nil)
    {
        TextCell *textCell = [tableView dequeueReusableCellWithIdentifier:@"TextCell"];
        textCell.myTextLabel.text = model.text;
        [textCell.myTextLabel sizeToFit];
        CGFloat textLabelHeight = textCell.myTextLabel.frame.origin.y+textCell.myTextLabel.frame.size.height;
        //NSLog(@"%f",textLabelHeight);
        return textLabelHeight + 30;
    }
    else
    {
        ImageCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        imageCell.myTextLabel.text = model.text;
        [imageCell.myTextLabel sizeToFit];
        CGFloat textLabelHeight = imageCell.myTextLabel.frame.origin.y+imageCell.myTextLabel.frame.size.height;
        return textLabelHeight + 120;
    }
    return 100.0;
}

@end
