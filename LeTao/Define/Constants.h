//
//  Constants.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/5.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

//在宏中使用 \ 可以达到换行的效果
#define WK(weakSelf)  __weak __typeof(&*self)weakSelf = self;
//定义RGB颜色宏
#define kRGBColor(R,G,B,Alpha) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:Alpha]
//定义屏幕宽
#define kScreenW  [UIScreen mainScreen].bounds.size.width
//定义屏幕高
#define kScreenH [UIScreen mainScreen].bounds.size.height

//存储当前选中的城市
#define kCurrentCityName @"kCurrentCityName"
//当前城市变化的通知
#define kCurrentCityChangeNotification @"kCurrentCityChangeNotification"
//获取当前城市
#define kCurrentCity  [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentCityName]

#endif /* Constants_h */
