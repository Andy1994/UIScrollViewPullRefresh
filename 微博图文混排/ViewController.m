//
//  ViewController.m
//  微博图文混排
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "ViewController.h"
#import "WeiBoView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WeiBoView *weiBoView = [WeiBoView defaultView];
    [self.view addSubview:weiBoView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
