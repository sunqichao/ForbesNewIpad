//
//  TodayAPI.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-2.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "TodayAPI.h"
#import "ChannelNewsListEntity.h"
#import "HeadNewsEntity.h"
#import "CoreDataManager.h"
#import "ASIFormDataRequest.h"

@implementation TodayAPI





/*
 
 得到今日头条的新闻数据
 
 */
+ (id)getTodayHeadInformation
{
    dispatch_queue_t queue = dispatch_queue_create("getTodayHeadInformation", NULL);
    
    dispatch_async(queue, ^(){
        NetworkStatus remoteHostStatus = [SQC_appdelegate.reachability currentReachabilityStatus];
        
        if(remoteHostStatus == NotReachable)
        {
            //不联网的情况下 从NSUserDefaults读取数据库
            NSDictionary *diction = [[NSUserDefaults standardUserDefaults] objectForKey:@"getTodayHeadInformation"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TouTiaoNotification" object:diction];

        }
        else
        {
            //联网状态下 请求接口
            NSString *URLString = [NSString stringWithFormat:@"%@/api/news/index-head-line",NewIpadHost];
            
            NSURL *url = [NSURL URLWithString:URLString];
            ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
            
            [request startSynchronous];
            
            //同步请求，直接取数据
            NSData *data=[request responseData];
            NSError *error;
            
            NSDictionary *diction = [[CJSONDeserializer deserializer] deserialize:data error:&error];

            [[NSUserDefaults standardUserDefaults] setObject:diction forKey:@"getTodayHeadInformation"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TouTiaoNotification" object:diction];

        }
        
        
    });
    
    
    return @"";
}

/*
 
 得到今日头条相关三篇的新闻数据
 
 */
+ (id)getTodayThreeHeadInformation
{
    dispatch_queue_t queue = dispatch_queue_create("getTodayThreeHeadInformation", NULL);
    
    dispatch_async(queue, ^(){
        NetworkStatus remoteHostStatus = [SQC_appdelegate.reachability currentReachabilityStatus];
        
        if(remoteHostStatus == NotReachable)
        {
            //不联网的情况下 从NSUserDefaults读取数据库
            NSDictionary *diction = [[NSUserDefaults standardUserDefaults] objectForKey:@"getTodayThreeHeadInformation"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"getTodayThreeHeadInformation" object:diction];
            
        }
        else
        {
            //联网状态下 请求接口
            NSString *URLString = [NSString stringWithFormat:@"%@/api/news/index-head-line-list",NewIpadHost];
            
            NSURL *url = [NSURL URLWithString:URLString];
            ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
            
            [request startSynchronous];
            
            //同步请求，直接取数据
            NSData *data=[request responseData];
            NSError *error;
            
            NSArray *array = [[CJSONDeserializer deserializer] deserialize:data error:&error];
            
            [[NSUserDefaults standardUserDefaults] setObject:array forKey:@"getTodayThreeHeadInformation"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TouTiaoThreeNotification" object:array];
            
        }
        
        
    });
    
    
    return @"";



}

/*
 
 得到每个频道的最新新闻的列表
 
 */
+ (id)getTodayChannelInformation
{
    dispatch_queue_t queue = dispatch_queue_create("getTodayChannelNewsInformation", NULL);
    
    dispatch_async(queue, ^(){
        NetworkStatus remoteHostStatus = [SQC_appdelegate.reachability currentReachabilityStatus];
        
        if(remoteHostStatus == NotReachable)
        {
            //不联网的情况下 从coredata读取数据库
            NSArray *result = [CoreDataManager getTodayChannelNewsFormCoreData];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"PinDaoTouTiaoNotification" object:result];
            
        }
        else
        {
            //联网状态下 请求接口
            NSString *URLString = [NSString stringWithFormat:@"%@/api/news/index-right-list",NewIpadHost];
            
            NSURL *url = [NSURL URLWithString:URLString];
            ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
            
            [request startSynchronous];
            
            //同步请求，直接取数据
            NSData *data=[request responseData];
            NSError *error;

            NSArray *array = [[CJSONDeserializer deserializer] deserialize:data error:&error];
            
            if ([CoreDataManager writeTodayChannelNewsToCoreData:array]) {
                
                NSArray *result = [CoreDataManager getTodayChannelNewsFormCoreData];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"PinDaoTouTiaoNotification" object:result];

                
            }
            
            
        }
        
        
    });
    
    return @"";
}







/*
 
 根据id得到详细的新闻阅读文章内容
 
 */

+ (id)getNewsContentByID:(NSString *)newsID
{
    NSString *newsIDString = newsID;
    
    dispatch_queue_t queue = dispatch_queue_create("getNewsContentInformation", NULL);
    
    dispatch_async(queue, ^(){
        NetworkStatus remoteHostStatus = [SQC_appdelegate.reachability currentReachabilityStatus];
        
        if(remoteHostStatus == NotReachable)
        {
            //不联网的情况下 从NSUserDefaults读取数据库
            NSDictionary *diction = [[NSUserDefaults standardUserDefaults] objectForKey:@"getNewsContentInformationKey"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateXinWenViewNotification" object:diction];
            
        }
        else
        {
            NSString *URLString = [NSString stringWithFormat:@"%@/api/news/get-info-by-newsid",NewIpadHost];
            
            NSURL *url = [NSURL URLWithString:URLString];
            ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
            
            [request setPostValue:newsIDString forKey:@"newsid"];
            [request startSynchronous];
            
            NSData *data=[request responseData];
            NSError *error;
            
            NSDictionary *diction = [[CJSONDeserializer deserializer] deserialize:data error:&error];
            
//            [[NSUserDefaults standardUserDefaults] setObject:diction forKey:@"getNewsContentInformationKey"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateXinWenViewNotification" object:diction];

            
            
        }
        
        
    });
    
    return @"";

}































@end
