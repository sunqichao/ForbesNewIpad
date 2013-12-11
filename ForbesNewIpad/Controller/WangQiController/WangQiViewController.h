//
//  WangQiViewController.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-11.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WangQiViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *wangqiTableView;


- (IBAction)appearFavorite:(id)sender;

- (IBAction)dismissView:(id)sender;


@end
