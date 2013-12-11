//
//  ChannelNewsListEntity.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-11.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ChannelNewsListEntity : NSManagedObject

@property (nonatomic, retain) NSString * channelName;
@property (nonatomic, retain) NSString * mainImage;
@property (nonatomic, retain) NSString * titleDetailText;
@property (nonatomic, retain) NSString * titleText;
@property (nonatomic, retain) NSString * newsid;

@end
