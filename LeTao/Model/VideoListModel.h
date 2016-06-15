//
//  VideoListModel.h
//  LeTao
//
//  Created by WelKin Xu on 16/6/5.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 解析原则：
 总体原则：遇到字典就新建类型。
 具体原则：先建好所有类型，再补充属性。
 .m文件内的实现不要忘记写；命名最好有层次感。
 */

//强制声明类型
//@class VideoListVideoListModel, VideoListVideoSidListModel;
/*
 安装插件解析JSON数据时，需要注意：
 1、检查类的命名是否规范
 2、检查属性中是否有关键字
 */
@class VideoListVideolistModel,VideoListVideosidlistModel;

@interface VideoListModel : NSObject

@property (nonatomic, copy) NSString *videoHomeSid;

@property (nonatomic, strong) NSArray<VideoListVideosidlistModel *> *videoSidList;

@property (nonatomic, strong) NSArray<VideoListVideolistModel *> *videoList;

@end

@interface  VideoListVideosidlistModel : NSObject

@property (nonatomic, copy) NSString *sid;

@property (nonatomic, copy) NSString *title;
//imgsrc -> imgSrc
@property (nonatomic, copy) NSString *imgsrc;

@end

@interface VideoListVideolistModel: NSObject
//ptime -> pTime
@property (nonatomic, copy) NSString *pTime;
//videosource -> videoSource
@property (nonatomic, copy) NSString *videoSource;

@property (nonatomic, copy) NSString *topicImg;

@property (nonatomic, copy) NSString *topicSid;

@property (nonatomic, copy) NSString *title;
//sectiontitle ->sectionTitle
@property (nonatomic, copy) NSString *sectionTitle;

@property (nonatomic, copy) NSString *vid;
//m3u8_url -> m3u8URL
@property (nonatomic, copy) NSString *m3u8URL;
//playersize -> playerSize
@property (nonatomic, assign) NSInteger playerSize;

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *replyBoard;

@property (nonatomic, assign) NSInteger playCount;

@property (nonatomic, assign) NSInteger length;

@property (nonatomic, copy) NSString *topicDesc;
//mp4Hd_url -> mp4HdURL
@property (nonatomic, copy) NSString *mp4HdURL;
//replyid -> replyID
@property (nonatomic, copy) NSString *replyID;
//m3u8Hd_url -> m3u8HdURL
@property (nonatomic, copy) NSString *m3u8HdURL;
//mp4_url -> mp4URL
@property (nonatomic, copy) NSString *mp4URL;
//description -> desc
@property (nonatomic, copy) NSString *desc;

@end


