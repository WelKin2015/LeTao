//
//  CityListViewModel.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/13.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "CityListViewModel.h"

@implementation CityListViewModel

-(NSInteger)sectionNumber {
    return self.cityGroups.count;
}

-(NSString *)titleForSection:(NSInteger)section {
    return [self.cityGroups[section] title];
}

-(NSString *)titleForRowAtIndexPath:(NSIndexPath*)indexPath {
    return [self.cityGroups[indexPath.section] cities][indexPath.row];
}

-(NSArray<NSString *> *)indexList {
    //获取cityGroups数组中每个元素的title属性
    return [self.cityGroups valueForKeyPath:@"title"];
}

-(NSInteger)rowNmuberForSection:(NSInteger)section {
    return [self.cityGroups[section] cities].count;
}



-(void)getCityGroupsCompletionHandler:(void (^)(NSError *))completionHandler {
    [PlistDataManager getCtiyGroups:^(NSArray<CityGroupsModel *> *cityGroups, NSError *error) {
        self.cityGroups = cityGroups;
        completionHandler(error);
    }];
}
@end
