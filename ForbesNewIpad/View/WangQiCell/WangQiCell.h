//
//  WangQiCell.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-16.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WangQiCell : UITableViewCell

@property (nonatomic ,strong) IBOutlet UIImageView *mainView;

@property (nonatomic ,strong) IBOutlet UILabel *title;

- (void)setDataSource:(id)dataSource;

+ (WangQiCell *)cellFromNibNamed:(NSString *)nibName;

@end
