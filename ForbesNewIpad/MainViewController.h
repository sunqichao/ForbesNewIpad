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

@property (weak, nonatomic) IBOutlet UIButton *channelJinritoutian;

@property (weak, nonatomic) IBOutlet UIButton *channelZhuanLan;

@property (weak, nonatomic) IBOutlet UIButton *channelBangDan;

@property (weak, nonatomic) IBOutlet UIButton *channelFuHao;

@property (weak, nonatomic) IBOutlet UIButton *channelChuangYe;

@property (weak, nonatomic) IBOutlet UIButton *channelKeJi;

@property (weak, nonatomic) IBOutlet UIButton *channelShangYe;

@property (weak, nonatomic) IBOutlet UIButton *channelTouZi;

@property (weak, nonatomic) IBOutlet UIButton *channelChengShi;

@property (weak, nonatomic) IBOutlet UIButton *channelShengHuo;

@property (weak, nonatomic) IBOutlet UIButton *channelTuJi;

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

- (IBAction)backToHome:(id)sender;

- (IBAction)openMuLu:(id)sender;

@end
