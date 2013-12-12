//
//  CoreDataManager.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-3.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "CoreDataManager.h"
#import "ChannelNewsListEntity.h"
#import "ArticleContentEntity.h"
#import "FavoriteNewsEntity.h"
@implementation CoreDataManager


+ (BOOL)writeTodayChannelNewsToCoreData:(id)data
{
    BOOL isSuccess = YES;
    
    NSArray *array = (NSArray *)data;
    [self clearAllTodayChannelNews];
    for (int i=0; i<[array count]; i++) {
        NSDictionary *dic = [array objectAtIndex:i];
        NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
        ChannelNewsListEntity *channelNews = [NSEntityDescription
                                              insertNewObjectForEntityForName:@"ChannelNewsListEntity"
                                              inManagedObjectContext:context];
        
        channelNews.newsid = [NSString stringWithFormat:@"%@",[dic objectForKey:@"newsid"]?[dic objectForKey:@"newsid"]:@""];
        channelNews.channelName = [NSString stringWithFormat:@"%@",[dic objectForKey:@"category_name"]?[dic objectForKey:@"category_name"]:@""];
        channelNews.mainImage = [NSString stringWithFormat:@"http://www.forbeschina.com%@",[dic objectForKey:@"img"]?[dic objectForKey:@"img"]:@""];
        channelNews.titleText = [NSString stringWithFormat:@"%@",[dic objectForKey:@"title"]?[dic objectForKey:@"title"]:@""];
        NSString *detail = [[NSString stringWithFormat:@"%@",[dic objectForKey:@"description"]?[dic objectForKey:@"description"]:@""]stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        channelNews.titleDetailText = detail;
        
        NSLog(@"%@",channelNews.mainImage);
        NSError *error;
        if (![context save:&error]) {
            isSuccess = NO;
            
        }else{
            isSuccess = YES;
            
            
        }

        
    }
    
    
    return isSuccess;

}

+ (BOOL)clearAllTodayChannelNews
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ChannelNewsListEntity"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    for (int i=0; i<[fetchedObjects count]; i++) {
        ChannelNewsListEntity *user = [fetchedObjects objectAtIndex:i];
        [context deleteObject:user];
    }
    
    return YES;
}

+ (id)getTodayChannelNewsFormCoreData
{
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ChannelNewsListEntity"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchLimit:100];   //控制分页查询的数量
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]==0) {
        return nil;
        
    }else
    {
        
    }
    
    return fetchedObjects;

}

+ (BOOL)writeNewsContentToCoreData:(id)data withID:(NSString *)newsid
{
    BOOL isSuccess = YES;
    
    NSDictionary *dic = (NSDictionary *)data;
    if (![self isSameArticleContentData:dic[@"created_at"]]) {
        NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
        ArticleContentEntity *content = [NSEntityDescription
                                         insertNewObjectForEntityForName:@"ArticleContentEntity"
                                         inManagedObjectContext:context];
        content.detail = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:dic[@"description"]]];
        content.shortTitle = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:dic[@"short_title"]]];
        content.content = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:dic[@"content"]]];
        content.author = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:dic[@"author"]]];
        content.createdAt = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:dic[@"created_at"]]];
        content.photoSrc = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:dic[@"photo_src"]]];
        content.title = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:dic[@"title"]]];
        content.newsId = [NSString stringWithFormat:@"%@",[SQC_StringUtility isEmptyString:newsid]];
        
        NSError *error;
        if (![context save:&error]) {
            isSuccess = NO;
            
        }else{
            isSuccess = YES;
            
            
        }

    }
    
    return isSuccess;

    
}

+ (id)getNewsContentByID:(id)idstring
{
    NSString *newsID = (NSString *)idstring;
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ArticleContentEntity"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"newsId = %@",newsID];
    [fetchRequest setPredicate:predicate];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]==0) {
        return nil;
        
    }else
    {
        
    }
    
    return [fetchedObjects objectAtIndex:0];

    
}

+ (BOOL)isSameArticleContentData:(NSString *)objectID
{
    BOOL isSame = NO;
    
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ArticleContentEntity"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"createdAt = %@",objectID];
    [fetchRequest setPredicate:predicate];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]>0) {
        isSame = YES;
    }else
    {
        isSame = NO;
    }
    
    return isSame;
    
}

+ (BOOL)writeFavoriteContentToCoreDate:(NSString *)title creatAt:(NSString *)time withID:(NSString *)newsid
{
    BOOL isSuccess = YES;
    

    if (![self isSameFavoriteContentData:newsid]) {
        NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
        FavoriteNewsEntity *content = [NSEntityDescription
                                         insertNewObjectForEntityForName:@"FavoriteNewsEntity"
                                         inManagedObjectContext:context];
        
        content.newsId = [NSString stringWithFormat:@"%@",newsid];
        content.title = title;
        content.createAt = time;
        
        NSError *error;
        if (![context save:&error]) {
            isSuccess = NO;
            
        }else{
            isSuccess = YES;
            
            
        }
        
    }
    
    return isSuccess;
    

}

+ (BOOL)isSameFavoriteContentData:(NSString *)objectID
{
    BOOL isSame = NO;
    
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"FavoriteNewsEntity"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"newsId = %@",objectID];
    [fetchRequest setPredicate:predicate];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]>0) {
        isSame = YES;
    }else
    {
        isSame = NO;
    }
    
    return isSame;
    
}

+ (id)getFavotieList
{
 
    NSManagedObjectContext *context = [SQC_appdelegate managedObjectContext];
    NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"FavoriteNewsEntity"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count]==0) {
        return nil;
        
    }else
    {
        
    }
    
    return fetchedObjects;


}

@end
