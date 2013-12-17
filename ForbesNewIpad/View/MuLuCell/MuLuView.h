//
//  MuLuView.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-16.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MuLuView : UIView

@property (nonatomic ,retain) IBOutlet UILabel *title;

@property (nonatomic ,retain) IBOutlet UIImageView *imageView;

- (void)setDataSource:(id)dataSource;

+ (MuLuView *)cellFromNibNamed:(NSString *)nibName;


@end
