//
//  HeadNewsEntity.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-2.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface HeadNewsEntity : NSManagedObject

@property (nonatomic, retain) NSString * headImageURL;
@property (nonatomic, retain) NSString * headText;
@property (nonatomic, retain) NSString * headDetailText;
@property (nonatomic, retain) NSString * firstText;
@property (nonatomic, retain) NSString * secondText;
@property (nonatomic, retain) NSString * thirdText;

@end
