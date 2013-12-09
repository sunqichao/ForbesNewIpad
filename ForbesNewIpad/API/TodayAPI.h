//
//  TodayAPI.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-2.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#define titleTextKey @"titelKey"
#define titleDetailTextKey @"titleDetailKey"
#define mainImageURLKey @"mainImageKey"
#define channelNameKey @"channelkey"

#define headImageURLKey @"image1"
#define headTextKey @"display"
#define headDetailTextKey @"description"
#define TextKey @"display"
#define secondTextKey @"secondTextKey"
#define thirdTextKey @"thirdTextKey"

@interface TodayAPI : NSObject


/*
 
 得到今日头条的新闻数据
 
 */
+ (id)getTodayHeadInformation;

/*
 
 得到今日头条相关三篇的新闻数据
 
 */
+ (id)getTodayThreeHeadInformation;

/*
 
 得到每个频道的最新新闻的列表
 
 */
+ (id)getTodayChannelInformation;


/*
 
 根据id得到详细的新闻阅读文章内容
 
 */
+ (id)getNewsContentByID:(NSString *)newsID;



























@end
