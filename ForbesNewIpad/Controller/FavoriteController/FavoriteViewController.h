//
//  FavoriteViewController.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-9.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *favoriteList;


- (IBAction)dismissView:(id)sender;

- (IBAction)appearWangQi:(id)sender;


@end
