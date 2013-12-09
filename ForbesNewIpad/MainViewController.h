//
//  MainViewController.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController



@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (strong, nonatomic) IBOutlet UIView *channelBarView;

- (IBAction)jinritoutiao:(id)sender;
- (IBAction)zhuanlan:(id)sender;
- (IBAction)bangdan:(id)sender;
- (IBAction)fuhao:(id)sender;
- (IBAction)chuangye:(id)sender;
- (IBAction)keji:(id)sender;
- (IBAction)shangye:(id)sender;
- (IBAction)touzi:(id)sender;
- (IBAction)chengshi:(id)sender;
- (IBAction)shenghuo:(id)sender;
- (IBAction)tuji:(id)sender;

- (IBAction)login:(id)sender;

- (IBAction)registerNumber:(id)sender;

- (IBAction)favoriteArticle:(id)sender;
@end
