//
//  MainViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "MainViewController.h"
#import "TodayViewController.h"
#import "ChannelItemViewController.h"
#import "DetailViewController.h"
#import "LoginViewController.h"
#import "ViewController.h"
#import "FavoriteViewController.h"


#define animationTime 1.0

@interface MainViewController ()

@property (nonatomic ,strong) TodayViewController *todayController;
@property (nonatomic ,strong) ChannelItemViewController *zhuanLan;
@property (nonatomic ,strong) DetailViewController *detailController;
@property (nonatomic ,strong) LoginViewController *loginController;
@property (nonatomic ,strong) ViewController *resgisterController;
@property (nonatomic ,strong) FavoriteViewController *favoriteController;

@end

@implementation MainViewController

- (id)initWithCoder:(NSCoder*)coder
{
    
    if (self =[super initWithCoder:coder]) {
        
        //今日头条
        _todayController = [[TodayViewController alloc] initWithCoder:nil];
        
        //专栏
        _zhuanLan = [[ChannelItemViewController alloc] initWithCoder:nil];
        
        //详细页
        _detailController = [[DetailViewController alloc] initWithCoder:nil];
        
        //登录页
        _loginController = [[LoginViewController alloc] initWithCoder:nil];
        
        //注册页
        _resgisterController = [[ViewController alloc] initWithCoder:nil];
        
        //收藏页
        _favoriteController = [[FavoriteViewController alloc] initWithCoder:nil];
        
        
        //显示详细页的通知
        [self addAppearDetailViewNotification];
        
        //隐藏详细页的通知
        [self addHidenDetailViewNotification];
        
        //隐藏登录注册收藏之类的页面
        [self addHidenTopBarViewNotification];
    }
    
    return self;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self.view addSubview:_todayController.view];
    
    
    [self.view addSubview:_zhuanLan.view];
    _zhuanLan.view.hidden = YES;

    [self.view addSubview:_detailController.view];
    _detailController.view.hidden = YES;
    
    [self.view addSubview:_loginController.view];
    _loginController.view.hidden = YES;
    
    [self.view addSubview:_resgisterController.view];
    _resgisterController.view.hidden = YES;
    
    [self.view addSubview:_favoriteController.view];
    _favoriteController.view.hidden = YES;
    
    //默认是进入今日头条
    _channelJinritoutian.selected = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _todayController.view.frame = CGRectMake(0, 100, 1024, 668);
    
    _zhuanLan.view.frame = CGRectMake(0, 100, 1024, 668);

    _detailController.view.frame = CGRectMake(0, 100, 1024, 668);

    _loginController.view.frame = CGRectMake(0, 50, 1024, 668);

    _resgisterController.view.frame = CGRectMake(0, 50, 1024, 668);

    _favoriteController.view.frame = CGRectMake(0, 50, 1024, 668);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
#pragma mark - 显示详细页得通知

- (void)addAppearDetailViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"AppearDetailViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"AppearDetailViewNotification ********");
         
         NSString *newsID = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             _detailController.contentID = newsID;
             [_detailController getContentData];
             _detailController.view.hidden = NO;
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:nil];
    
}

#pragma mark - 隐藏详细页得通知

- (void)addHidenDetailViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"HidenDetailViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"HidenDetailViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             _detailController.view.hidden = YES;
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenDetailViewNotification" object:nil];
    
}

#pragma mark - 隐藏登陆注册收藏目录等页面的通知得通知

- (void)addHidenTopBarViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"HidenTopBarViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"HidenTopBarViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];
    
}


//隐藏所有的页面
- (void)hideAllView
{
    _todayController.view.hidden = YES;
    _zhuanLan.view.hidden = YES;
    _loginController.view.hidden = YES;
}

//隐藏登陆注册收藏目录等页面
- (void)hideTopBarView
{
    _loginController.view.hidden = YES;
    _resgisterController.view.hidden = YES;
    _favoriteController.view.hidden = YES;
}

//所有按钮处于不选择状态
- (void)unselectAllButton
{
    _channelJinritoutian.selected = NO;
    _channelZhuanLan.selected = NO;
    _channelBangDan.selected = NO;
    _channelFuHao.selected = NO;
    _channelChuangYe.selected = NO;
    _channelKeJi.selected = NO;
    _channelShangYe.selected = NO;
    _channelTouZi.selected = NO;
    _channelChengShi.selected = NO;
    _channelShengHuo.selected = NO;
    _channelTuJi.selected = NO;

}

#pragma mark - 今日头条

- (IBAction)jinritoutiao:(id)sender {
    NSLog(@"jin ri tou tiao");

    [self hideAllView];
    
    _todayController.view.hidden = NO;
    
    [self unselectAllButton];

    _channelJinritoutian.selected = YES;
}

#pragma mark - 专栏

- (IBAction)zhuanlan:(id)sender {
    NSLog(@"zhuan lan");
    [self hideAllView];

    _zhuanLan.view.hidden = NO;
    
    [self unselectAllButton];
    
    _channelZhuanLan.selected = YES;
}

#pragma mark - 榜单

- (IBAction)bangdan:(id)sender {
    NSLog(@"bang dan");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelBangDan.selected = YES;

}

#pragma mark - 富豪

- (IBAction)fuhao:(id)sender {
    NSLog(@"fu hao");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelFuHao.selected = YES;

}

#pragma mark - 创业

- (IBAction)chuangye:(id)sender {
    NSLog(@"chuang ye");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelChuangYe.selected = YES;

}

#pragma mark - 科技

- (IBAction)keji:(id)sender {
    NSLog(@"ke ji");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelKeJi.selected = YES;

}

#pragma mark - 商业

- (IBAction)shangye:(id)sender {
    NSLog(@"shang ye");

    [self hideAllView];

    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelShangYe.selected = YES;
}

#pragma mark - 投资

- (IBAction)touzi:(id)sender {
    NSLog(@"tou zi");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelTouZi.selected = YES;

}

#pragma mark - 城市

- (IBAction)chengshi:(id)sender {
    NSLog(@"sheng shi");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelChengShi.selected = YES;

}

#pragma mark - 生活

- (IBAction)shenghuo:(id)sender {
    NSLog(@"sheng huo");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelShengHuo.selected = YES;

}

#pragma mark - 图集

- (IBAction)tuji:(id)sender {
    NSLog(@"tu ji");

    [self hideAllView];
    
    _zhuanLan.view.hidden = NO;

    [self unselectAllButton];
    
    _channelTuJi.selected = YES;

}

#pragma mark - 登录方法

- (IBAction)login:(id)sender {
    NSLog(@"login ");
    
    [self hideTopBarView];
    
    _loginController.view.hidden = NO;
    
}

#pragma mark - 注册方法

- (IBAction)registerNumber:(id)sender {
    NSLog(@"resgiter ");
    
    [self hideTopBarView];
    
    _resgisterController.view.hidden = NO;
    
    
}

#pragma mark - 收藏方法

- (IBAction)favoriteArticle:(id)sender {
    NSLog(@"favorite  ");
    
    [self hideTopBarView];
    
    _favoriteController.view.hidden = NO;
    
}


@end
