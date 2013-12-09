//
//  JinritoutiaoCell.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-2.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JinritoutiaoCell : UITableViewCell

@property (strong ,nonatomic) IBOutlet UILabel *channelName;

@property (strong ,nonatomic) IBOutlet UIImageView *mainImageView;

@property (strong ,nonatomic) IBOutlet UILabel *titleLabel;

@property (strong ,nonatomic) IBOutlet UILabel *titleDetailLabel;

- (void)setDataSource:(id)dataSource;

+ (JinritoutiaoCell *)cellFromNibNamed:(NSString *)nibName;

@end
