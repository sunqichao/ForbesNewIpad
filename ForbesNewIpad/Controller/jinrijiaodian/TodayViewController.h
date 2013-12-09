//
//  TodayViewController.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong ,nonatomic) IBOutlet UITableView *channelNewsTable;

@property (strong ,nonatomic) IBOutlet UIImageView *headImageView;

@property (strong ,nonatomic) IBOutlet UILabel *headLabel;

@property (strong ,nonatomic) IBOutlet UILabel *headDetailLabel;

@property (strong ,nonatomic) IBOutlet UILabel *firstLabel;

@property (strong ,nonatomic) IBOutlet UILabel *secondLabel;

@property (strong ,nonatomic) IBOutlet UILabel *thirdLabel;


- (IBAction)clickHeadLine:(id)sender;

- (IBAction)clickFirstNews:(id)sender;

- (IBAction)clickSecondNews:(id)sender;

- (IBAction)clcikThirdNews:(id)sender;

@end
