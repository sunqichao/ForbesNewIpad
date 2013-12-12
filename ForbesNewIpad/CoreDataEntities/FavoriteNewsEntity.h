//
//  FavoriteNewsEntity.h
//  ForbesNewIpad
//
//  Created by sunqichao on 13-12-12.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface FavoriteNewsEntity : NSManagedObject

@property (nonatomic, retain) NSString * newsId;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * createAt;

@end
