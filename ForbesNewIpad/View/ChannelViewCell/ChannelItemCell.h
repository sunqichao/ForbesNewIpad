//
//  ChannelItemCell.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-9.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelItemCell : UICollectionViewCell


@property (nonatomic ,retain) IBOutlet UILabel *title;
@property (nonatomic ,retain) IBOutlet UILabel *detail;

- (void)setDataSource:(id)dataSource;


@end
