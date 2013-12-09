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
        
        // 初始化代码
        _todayController = [[TodayViewController alloc] initWithCoder:nil];
        _zhuanLan = [[ChannelItemViewController alloc] initWithCoder:nil];
        _detailController = [[DetailViewController alloc] initWithCoder:nil];
        _loginController = [[LoginViewController alloc] initWithCoder:nil];
        _resgisterController = [[ViewController alloc] initWithCoder:nil];
        _favoriteController = [[FavoriteViewController alloc] initWithCoder:nil];
        
        [self addAppearDetailViewNotification];
        [self addHidenDetailViewNotification];
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



- (void)hideAllView
{
    _todayController.view.hidden = YES;
    _zhuanLan.view.hidden = YES;
    _loginController.view.hidden = YES;
}

- (void)hideTopBarView
{
    _loginController.view.hidden = YES;
    _resgisterController.view.hidden = YES;
    _favoriteController.view.hidden = YES;
}

- (IBAction)jinritoutiao:(id)sender {
    NSLog(@"jin ri tou tiao");

    [self hideAllView];
    
    _todayController.view.hidden = NO;
    
}

- (IBAction)zhuanlan:(id)sender {
    NSLog(@"zhuan lan");
    [self hideAllView];

    _zhuanLan.view.hidden = NO;
}

- (IBAction)bangdan:(id)sender {
    NSLog(@"bang dan");

    [self hideAllView];

}

- (IBAction)fuhao:(id)sender {
    NSLog(@"fu hao");

    [self hideAllView];

}

- (IBAction)chuangye:(id)sender {
    NSLog(@"chuang ye");

    [self hideAllView];

}

- (IBAction)keji:(id)sender {
    NSLog(@"ke ji");

    [self hideAllView];

}

- (IBAction)shangye:(id)sender {
    NSLog(@"shang ye");

    [self hideAllView];

}

- (IBAction)touzi:(id)sender {
    NSLog(@"tou zi");

    [self hideAllView];

}

- (IBAction)chengshi:(id)sender {
    NSLog(@"sheng shi");

    [self hideAllView];

}

- (IBAction)shenghuo:(id)sender {
    NSLog(@"sheng huo");

    [self hideAllView];

}

- (IBAction)tuji:(id)sender {
    NSLog(@"tu ji");

    [self hideAllView];

}

- (IBAction)login:(id)sender {
    NSLog(@"login ");
    
    [self hideTopBarView];
    
    _loginController.view.hidden = NO;
    
}

- (IBAction)registerNumber:(id)sender {
    NSLog(@"resgiter ");
    
    [self hideTopBarView];
    
    _resgisterController.view.hidden = NO;
    
    
}

- (IBAction)favoriteArticle:(id)sender {
    NSLog(@"favorite  ");
    
    [self hideTopBarView];
    
    _favoriteController.view.hidden = NO;
    
}


@end
