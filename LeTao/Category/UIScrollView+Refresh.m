//
//  UIScrollView+Refresh.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/5.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)

-(void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block {
    self.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:block];
}

-(void)beginHeaderRefresh {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_header beginRefreshing];
    });
}

-(void)endHeaderRefresh {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_header endRefreshing];
    });
}

-(void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block {
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
}

-(void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block {
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}

-(void)beginFooterRefresh {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_footer beginRefreshing];
    });
}

-(void)endFooterRefresh {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.mj_footer endRefreshing];
    });
}

@end
