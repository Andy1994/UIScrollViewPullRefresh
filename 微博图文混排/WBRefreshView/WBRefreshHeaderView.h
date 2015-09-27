//
//  WBRefreshHeaderView.h
//  上下拉刷新
//
//  Created by qianfeng on 15/9/27.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBRefreshBaseView.h"

@interface WBRefreshHeaderView : WBRefreshBaseView

+ (instancetype)headerWithRefreshHandler:(WBRefreshedHandler)refreshHandler;

@end
