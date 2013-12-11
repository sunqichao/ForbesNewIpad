//
//  FavoriteCell.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-11.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteCell : UITableViewCell

@property (nonatomic ,retain) IBOutlet UILabel *title;

@property (nonatomic ,retain) IBOutlet UILabel *description;

- (void)setDataSource:(id)dataSource;



+ (FavoriteCell *)cellFromNibNamed:(NSString *)nibName;

@end
