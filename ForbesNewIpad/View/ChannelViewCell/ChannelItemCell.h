//
//  ChannelItemCell.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-9.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelItemCell : UICollectionViewCell


@property (nonatomic ,retain) UILabel *title;
@property (nonatomic ,retain) UILabel *detail;
@property (nonatomic ,retain) UILabel *channel;

@property (nonatomic ,retain) UIImageView *imageview;

- (void)setDataSource:(id)dataSource;


@end
