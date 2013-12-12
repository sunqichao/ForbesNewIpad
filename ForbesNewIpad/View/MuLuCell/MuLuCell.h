//
//  MuLuCell.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-12.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MuLuCell : UITableViewCell

@property (nonatomic ,retain) IBOutlet UILabel *titleLabel;


- (void)setDataSource:(id)dataSource;


+ (MuLuCell *)cellFromNibNamed:(NSString *)nibName;

@end
