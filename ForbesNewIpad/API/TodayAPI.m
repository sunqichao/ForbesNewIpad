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
            id result = [CoreDataManager getNewsContentByID:newsIDString];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateXinWenViewNotification" object:result];
            
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
            
            if ([CoreDataManager writeNewsContentToCoreData:diction withID:newsIDString]) {
                
                id result = [CoreDataManager getNewsContentByID:newsIDString];
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateXinWenViewNotification" object:result];
                
                
            }
            
            
        }
        
        
    });
    
    return @"";

}


/*
 
 根据id得到频道页的新闻
 
 */
+ (id)getChannelNewsByID:(NSString *)CID
{
    NSString *newsIDString = CID;
    
    NSString *notificationName = [NSString stringWithFormat:@"PinDaoItemNotification%@",newsIDString];

    dispatch_queue_t queue = dispatch_queue_create("getChannelNewsInformation", NULL);
    
    dispatch_async(queue, ^(){
        NetworkStatus remoteHostStatus = [SQC_appdelegate.reachability currentReachabilityStatus];
        
        if(remoteHostStatus == NotReachable)
        {
            //不联网的情况下 从NSUserDefaults读取数据库
            NSDictionary *diction = [[NSUserDefaults standardUserDefaults] objectForKey:@"getChannelNewsInformationKey"];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:diction];
            
        }
        else
        {
            NSString *URLString = [NSString stringWithFormat:@"%@/api/news/channel-main",NewIpadHost];
            
            NSURL *url = [NSURL URLWithString:URLString];
            ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
            [request setPostValue:newsIDString forKey:@"cid"];
            [request startSynchronous];
            
            NSData *data=[request responseData];
            NSError *error;
            
            NSDictionary *diction = [[CJSONDeserializer deserializer] deserialize:data error:&error];
            
            //            [[NSUserDefaults standardUserDefaults] setObject:diction forKey:@"getChannelNewsInformationKey"];
            //            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:diction];
            
            
            
        }
        
        
    });

    
    return @"";
}



+ (void)loginWithUserName:(NSString *)name keyWord:(NSString *)keyWord
{
    dispatch_queue_t queue = dispatch_queue_create("getUserInfoLogin", NULL);
    
    dispatch_async(queue, ^(){
        NSString *URLString = [NSString stringWithFormat:@"%@/api/user/login",NewIpadHost];
        NSURL *url = [NSURL URLWithString:URLString];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        [request setPostValue:name forKey:@"username"];
        [request setPostValue:keyWord forKey:@"password"];
        [request startSynchronous];
        
        //同步请求，直接取数据
        NSData *data=[request responseData];
        NSError *error;
        
        NSDictionary *diction = [[CJSONDeserializer deserializer] deserialize:data error:&error];

        [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginDoneViewNotification" object:nil];

        NSLog(@"登陆接口返回数据  %@", diction);
    });
    
    
    
}

+ (void)registerWithUserName:(NSString *)name nickName:(NSString *)nickName keyWord:(NSString *)keyWord
{
    dispatch_queue_t queue = dispatch_queue_create("getUserInfoRegister", NULL);
    
    dispatch_async(queue, ^(){
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        
        // app名称
        NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
        
        // app版本
        NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        NSString *systemVersion = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] systemVersion]];
        NSString *systemName = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] systemName]];
        NSString *model = [NSString stringWithFormat:@"%@",[[UIDevice currentDevice] model]];
        
        systemVersion=@"123";
        systemName=@"123";
        model=@"123";
        app_Name=@"123";
        app_Version=@"123";
        
        NSString *URLString = [NSString stringWithFormat:@"%@/api/user/register",NewIpadHost];
        NSURL *url = [NSURL URLWithString:URLString];
        ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
        [request setPostValue:name forKey:@"name"];
        [request setPostValue:nickName forKey:@"nickname"];
        [request setPostValue:keyWord forKey:@"password"];
        [request setPostValue:systemVersion forKey:@"systemVersion"];
        [request setPostValue:systemName forKey:@"systemName"];
        [request setPostValue:model forKey:@"model"];
        [request setPostValue:app_Name forKey:@"appName"];
        [request setPostValue:app_Version forKey:@"appVersion"];
        [request startSynchronous];
        
        //同步请求，直接取数据
        NSData *data=[request responseData];
        NSError *error;
        
        NSDictionary *diction = [[CJSONDeserializer deserializer] deserialize:data error:&error];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterDoneViewNotification" object:nil];
        
        NSLog(@"注册接口返回数据  %@", diction);
    });

}



























@end
