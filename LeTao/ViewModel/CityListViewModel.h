//
//  CityListViewModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/13.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlistDataManager.h"

@interface CityListViewModel : NSObject

/**UI*/
@property(nonatomic) NSInteger sectionNumber;
-(NSInteger )rowNmuberForSection : (NSInteger) section;
-(NSString *) titleForSection :(NSInteger )section;
-(NSString *) titleForRowAtIndexPath : (NSIndexPath *) indexPath;

/** 索引数组*/
@property (nonatomic,strong) NSArray<NSString *> *indexList;

/**Model*/
/** 城市数组*/
@property (nonatomic,strong) NSArray<CityGroupsModel *> *cityGroups;
-(void)getCityGroupsCompletionHandler :(void(^) (NSError *error )) completionHandler;

@end
