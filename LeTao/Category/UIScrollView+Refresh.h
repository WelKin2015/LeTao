//
//  UIScrollView+Refresh.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/5.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>

@interface UIScrollView (Refresh)

/**添加头部刷新*/
-(void)addHeaderRefresh :(MJRefreshComponentRefreshingBlock)block;

/**开始头部刷新*/
-(void)beginHeaderRefresh;

/**结束头部刷新*/
-(void)endHeaderRefresh;

/**添加底部自动刷新*/
-(void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block;

/**添加底部返回刷新*/
-(void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block;

/**开始底部刷新*/
-(void)beginFooterRefresh;

/**结束底部刷新*/
-(void)endFooterRefresh;

@end
