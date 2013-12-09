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


@end
