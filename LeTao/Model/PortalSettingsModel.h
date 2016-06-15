//
//  PortalSettingsModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/11.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PortalSettingsMapsModel;
@interface PortalSettingsModel : NSObject

@property (nonatomic, assign) NSInteger version;

@property (nonatomic, strong) NSArray<PortalSettingsMapsModel *> *maps;

@property (nonatomic, copy) NSString *scheme;

@property (nonatomic, strong) NSArray<NSString *> *rootPages;

@end
@interface PortalSettingsMapsModel : NSObject

@property (nonatomic, copy) NSString *URL;

@property (nonatomic, copy) NSString *rootPage;

@property (nonatomic, copy) NSString *comment;

@property (nonatomic, copy) NSString *segue;

@property (nonatomic, copy) NSString *page;

@end

