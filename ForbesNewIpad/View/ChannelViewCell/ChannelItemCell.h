//
//  ChannelItemCell.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-9.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelItemCell : UICollectionViewCell

- (void)setDataSource:(id)dataSource;

+ (ChannelItemCell *)cellFromNibNamed:(NSString *)nibName;

@end
