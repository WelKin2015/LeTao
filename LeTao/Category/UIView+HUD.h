//
//  UIView+HUD.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/3.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>

@interface UIView (HUD)
/**显示文字提示*/
-(void)showWarning : (NSString *) warningWords;

/**显示忙提示*/
-(void)showBusyHUD;

/**隐藏忙提示*/
-(void)hideBusyHUD;

@end
