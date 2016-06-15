//
//  AppDelegate.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/2.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

/*模块制作顺序
 1、Model ->网络的结构数据模型
 2、网络请求 -> 依赖Model，因为数据收到以后需要用Model解析
 3、ViewModel -> 结合UI和模型层，制作逻辑。
 4、View
 5、ViewController
 */

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

