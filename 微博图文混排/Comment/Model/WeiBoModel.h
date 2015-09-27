//
//  WeiBoModel.h
//  微博图文混排
//
//  Created by qianfeng on 15/9/25.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeiBoModel : NSObject
@property (nonatomic,copy) NSString *picture;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSNumber *vip;
@end
