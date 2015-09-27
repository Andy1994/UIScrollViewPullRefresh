//
//  WeiBoView.m
//  微博图文混排
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WeiBoView.h"
#import "WeiBoModel.h"
#import "TextCell.h"
#import "ImageCell.h"
#import "CellFactory.h"

#import "WBRefreshFooterView.h"
#import "WBRefreshHeaderView.h"
#import "UIScrollView+WBRefresh.h"

@interface WeiBoView()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,copy) NSArray *dataArray;
@end

@implementation WeiBoView
{
    UITableView *_tableView;
    WBRefreshHeaderView *headerView;
    WBRefreshFooterView *footerView;
}

+ (instancetype)defaultView
{
    return [[self alloc] init];
}

- (NSArray *)dataArray
{
    if(_dataArray == nil)
    {
        NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        for(NSDictionary *weibo in array)
        {
            WeiBoModel *model = [[WeiBoModel alloc] init];
            [model setValuesForKeysWithDictionary:weibo];
            [mutableArray addObject:model];
        }
        _dataArray = mutableArray;
    }
    return _dataArray;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    [self addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"TextCell" bundle:nil] forCellReuseIdentifier:@"TextCell"];
    [_tableView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellReuseIdentifier:@"ImageCell"];
    [self addRefreshView];
    //[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiBoModel *model = _dataArray[indexPath.row];
    return [CellFactory tableView:tableView withModel:model];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiBoModel *model = _dataArray[indexPath.row];
    return [CellFactory cellHeight:model withTableView:tableView];
}

- (void)addRefreshView {
    
    __weak __typeof(self)weakSelf = self;
    
    //下拉刷新
    headerView = [_tableView addHeaderWithRefreshHandler:^(WBRefreshBaseView *refreshView) {
        [weakSelf refreshAction];
    }];
    
    //上拉加载更多
    footerView = [_tableView addFooterWithRefreshHandler:^(WBRefreshBaseView *refreshView) {
        [weakSelf loadMoreAction];
    }];
    
    //自动刷新
    footerView.autoLoadMore = NO;
}
- (void)refreshAction {
    __weak UITableView *weakTableView = _tableView;
    __weak WBRefreshHeaderView *weakHeaderView = headerView;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [weakTableView reloadData];
        [weakHeaderView endRefresh];
    });
}
- (void)loadMoreAction {
    __weak UITableView *weakTableView = _tableView;
    __weak WBRefreshFooterView *weakFooterView = footerView;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [weakTableView reloadData];
        [weakFooterView endRefresh];
    });
}

@end
