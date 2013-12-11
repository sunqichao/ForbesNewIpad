//
//  CoreDataManager.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-3.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "CoreDataManager.h"
#import "ChannelNewsListEntity.h"
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




@end
