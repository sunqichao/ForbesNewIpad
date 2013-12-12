//
//  CoreDataManager.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-3.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject

/*
 
 把今日频道头条的新闻写入数据库

 */
+ (BOOL)writeTodayChannelNewsToCoreData:(id)data;

/*
 
 从数据库重读取今日频道头条的新闻
 
 */
+ (id)getTodayChannelNewsFormCoreData;


/*
 
 把新闻内容写入数据库 同时写入newsid
 
 */
+ (BOOL)writeNewsContentToCoreData:(id)data withID:(NSString *)newsid;

/*
 
 根据ID来获取指定新闻内容
 
 */
+ (id)getNewsContentByID:(id)idstring;

/*
 
 收藏的文章写入数据库
 
 */
+ (BOOL)writeFavoriteContentToCoreDate:(NSString *)title creatAt:(NSString *)time withID:(NSString *)newsid;


/*
 
 获取收藏文章列表数据数组
 
 */
+ (id)getFavotieList;


@end
