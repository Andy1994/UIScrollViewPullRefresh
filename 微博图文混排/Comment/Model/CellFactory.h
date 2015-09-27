//
//  CellFactory.h
//  微博图文混排
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeiBoModel.h"
#import <UIKit/UIKit.h>

@interface CellFactory : NSObject

+ (CGFloat)cellHeight:(WeiBoModel *)model withTableView:(UITableView *)tableView;

+ (UITableViewCell *)tableView:(UITableView *)tableView withModel:(WeiBoModel *)model;

@end
