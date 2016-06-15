//
//  MainViewModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/12.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "MainViewModel.h"

@implementation MainViewModel

-(NSInteger )rowNumber {
    return self.menuDataList.count;
}

-(NSString *)iconNameForIndex:(NSInteger)index {
    return [self.menuDataList[index] image];
}

-(NSString *)titleForIndex:(NSInteger)index {
    return [self.menuDataList[index] title];
}


-(void)getMenuData:(void (^)(NSError *))completionHandler {
    [PlistDataManager getMenuData:^(NSArray<MenuDataModel *> *menuData, NSError *error) {
        self.menuDataList = menuData;
        completionHandler(error);
    }];
}

@end
