//
//  MainViewModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/12.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlistDataManager.h"

/**
 *  ViewModel层是介于请求层和控制器之间，用于完成视图显示和底层数据模型之间的逻辑
    原则：ViewModel绝对不会出现UI开头的类
 */
@interface MainViewModel : NSObject

/**根据UI定义属性和方法*/
/** 属性*/
@property (nonatomic) NSInteger rowNumber;
/**方法*/
-(NSString *)iconNameForIndex : (NSInteger)index;
-(NSString *)titleForIndex : (NSInteger)index;

/**根据Model定义属性和方法*/
/**属性*/
@property (nonatomic,strong) NSArray<MenuDataModel *> *menuDataList;
/**方法*/
-(void)getMenuData:(void(^)(NSError *error))completionHandler;

@end
