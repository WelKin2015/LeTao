//
//  HomeListModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/6.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HomeListRecommendModel,HomeListDataModel,HomeListRecommendDataLinkObjectModel,HomeListRecommendDataModel;
/**HomeListModel*/
@interface HomeListModel : NSObject

@property (nonatomic, strong) HomeListRecommendModel *recommend;

@property (nonatomic, strong) NSArray<HomeListDataModel *> *data;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, copy) NSString *icon;

@end


/**HomeListDataModel*/
@interface HomeListDataModel : NSObject

@property (nonatomic, copy) NSString *nick;
//weight_add ->weightAdd
@property (nonatomic, copy) NSString *weightAdd;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;
//follow_add -> followAdd
@property (nonatomic, copy) NSString *follow_add;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;
//play_count -> playCount
@property (nonatomic, copy) NSString *playCount;
//negative_view -> negativeView
@property (nonatomic, copy) NSString *negativeView;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;
//coin_add -> coinAdd
@property (nonatomic, copy) NSString *coinAdd;
//default_image -> defaultImage
@property (nonatomic, copy) NSString *defaultImage;

@property (nonatomic, copy) NSString *intro;
//category_name -> categoryName
@property (nonatomic, copy) NSString *categoryName;
//create_at -> createAt
@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;
//recommend_image -> recommendImage
@property (nonatomic, copy) NSString *recommendImage;
//locked_view -> lockedView
@property (nonatomic, copy) NSString *lockedView;
//last_end_at -> lastEndAt
@property (nonatomic, copy) NSString *lastEndAt;
//video_quality -> videoQuality
@property (nonatomic, copy) NSString *videoQuality;
//first_play_at ->firstPlayAt
@property (nonatomic, copy) NSString *firstPlayAt;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, assign) NSInteger follow;
//follow_bak -> followBak
@property (nonatomic, copy) NSString *followBak;
//play_at -> playAt
@property (nonatomic, copy) NSString *playAt;
//ategory_id -> ategoryID
@property (nonatomic, copy) NSString *categoryID;
//category_slug -> categorySlug
@property (nonatomic, copy) NSString *categorySlug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *title;
//app_shuffling_image ->appShufflingImage
@property (nonatomic, copy) NSString *appShufflingImage;

@end

/**HomeListRecommendModel*/
@interface HomeListRecommendModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;
//data -> recommendData
@property (nonatomic, strong) NSArray<HomeListRecommendDataModel *> *recommendData;

@end

/**HomeListRecommendDataModel*/
@interface HomeListRecommendDataModel : NSObject
//link_object -> recommendDataLinkObject
@property (nonatomic, strong) HomeListRecommendDataLinkObjectModel *recommendDataLinkObject;

//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, copy) NSString *content;
//subtitle -> subTitle
@property (nonatomic, copy) NSString *subTitle;
//slot_id -> slotID
@property (nonatomic, assign) NSInteger slotID;

@property (nonatomic, copy) NSString *link;

@property (nonatomic, assign) NSInteger priority;

@property (nonatomic, copy) NSString *title;
//create_at -> createAt
@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *ext;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *fk;

@end

/**HomeListRecommendDataLinkObjectModel*/
@interface HomeListRecommendDataLinkObjectModel : NSObject

@property (nonatomic, copy) NSString *nick;
//weight_add ->weightAdd
@property (nonatomic, copy) NSString *weightAdd;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *level;
//follow_add -> followAdd
@property (nonatomic, copy) NSString *followAdd;

@property (nonatomic, copy) NSString *slug;

@property (nonatomic, copy) NSString *check;

@property (nonatomic, copy) NSString *thumb;
//play_count -> playCount
@property (nonatomic, copy) NSString *playCount;
//negative_view -> negativeView
@property (nonatomic, copy) NSString *negativeView;

@property (nonatomic, copy) NSString *view;

@property (nonatomic, copy) NSString *grade;

@property (nonatomic, copy) NSString *coin;
//coin_add -> coinAdd
@property (nonatomic, copy) NSString *coinAdd;
//default_image -> defaultImage
@property (nonatomic, copy) NSString *defaultImage;

@property (nonatomic, copy) NSString *intro;
//category_name -> categoryName
@property (nonatomic, copy) NSString *categoryName;
//create_at -> createAt
@property (nonatomic, copy) NSString *createAt;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *avatar;
//recommend_image -> recommendImage
@property (nonatomic, copy) NSString *recommendImage;
//locked_view -> lockedView
@property (nonatomic, copy) NSString *lockedView;
//last_end_at -> lastEndAt
@property (nonatomic, copy) NSString *lastEndAt;
//video_quality -> videoQuality
@property (nonatomic, copy) NSString *videoQuality;
//first_play_at ->firstPlayAt
@property (nonatomic, copy) NSString *firstPlayAt;

@property (nonatomic, copy) NSString *announcement;

@property (nonatomic, copy) NSString *follow;
//follow_bak -> followBak
@property (nonatomic, copy) NSString *followBak;
//play_at -> playAt
@property (nonatomic, copy) NSString *playAt;
//ategory_id -> ategoryID
@property (nonatomic, copy) NSString *categoryID;
//category_slug -> categorySlug
@property (nonatomic, copy) NSString *categorySlug;

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, copy) NSString *title;
//app_shuffling_image ->appShufflingImage
@property (nonatomic, copy) NSString *appShufflingImage;

@end



