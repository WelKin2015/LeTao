//
//  UIView+HUD.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/3.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "UIView+HUD.h"
//方法中最好不要出现具体的字符串和数字，无意义
//自定义宏定义以小写k开头，以区分系统级别宏定义
#define kShowWarningDelayDuration 1.5
#define kTimeoutDuration 30

@implementation UIView (HUD)

-(void)showWarning:(NSString *)warningWords {
    //为使用者考虑，鉴于如果子线程执行此方法会崩溃，因此要把方法做成线程安全的。
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        [hud setMode:MBProgressHUDModeText];
        hud.labelText = warningWords;
        [hud hide:YES afterDelay:kShowWarningDelayDuration];
    });

}

-(void)showBusyHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self animated:YES];
        [[MBProgressHUD showHUDAddedTo:self animated:YES] hide:YES afterDelay:kTimeoutDuration];
    });
}

-(void)hideBusyHUD {
    dispatch_async(dispatch_get_main_queue(), ^{
            [MBProgressHUD hideAllHUDsForView:self animated:YES];
    });
}

@end
