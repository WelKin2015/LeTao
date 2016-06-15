//
//  WebViewController.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

-(instancetype)initWithURL:(NSURL *)webURL;

/** URL属性*/
@property (nonatomic,strong) NSURL *webURL;

@end
