//
//  ArticleContentEntity.h
//  ForbesNewIpad
//
//  Created by sunqichao on 13-12-11.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ArticleContentEntity : NSManagedObject

@property (nonatomic, retain) NSString * detail;
@property (nonatomic, retain) NSString * shortTitle;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * createdAt;
@property (nonatomic, retain) NSString * photoSrc;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * newsId;

@end
