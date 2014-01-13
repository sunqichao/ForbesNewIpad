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
#import "AboutViewController.h"
#import "WangQiViewController.h"
#import "MuLuViewController.h"

@interface MainViewController ()

@property (nonatomic ,strong) TodayViewController *todayController;

@property (nonatomic ,strong) ChannelItemViewController *zhuanLan;
@property (nonatomic ,strong) ChannelItemViewController *bangdan;
@property (nonatomic ,strong) ChannelItemViewController *fuhao;
@property (nonatomic ,strong) ChannelItemViewController *chuangye;
@property (nonatomic ,strong) ChannelItemViewController *keji;
@property (nonatomic ,strong) ChannelItemViewController *shangye;
@property (nonatomic ,strong) ChannelItemViewController *touzi;
@property (nonatomic ,strong) ChannelItemViewController *chengshi;
@property (nonatomic ,strong) ChannelItemViewController *shenghuo;
@property (nonatomic ,strong) ChannelItemViewController *tuji;

@property (nonatomic ,strong) DetailViewController *detailController;
@property (nonatomic ,strong) LoginViewController *loginController;
@property (nonatomic ,strong) ViewController *resgisterController;
@property (nonatomic ,strong) FavoriteViewController *favoriteController;
@property (nonatomic ,strong) AboutViewController *aboutController;
@property (nonatomic ,strong) WangQiViewController *wangQiController;
@property (nonatomic ,strong) MuLuViewController *muluController;

@property (nonatomic ,strong) NSArray *channelArray;
@property (nonatomic ,strong) NSArray *channelButtonArray;
@property (nonatomic ,strong) NSArray *channelCid;
@property (nonatomic ,assign) int currentChannelIndex;



@end

@implementation MainViewController

- (id)initWithCoder:(NSCoder*)coder
{
    
    if (self =[super initWithCoder:coder]) {
        
        //今日头条
        _todayController = [[TodayViewController alloc] initWithCoder:nil];
        
        //专栏
        _zhuanLan = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidZhuanLan withTitle:@"专栏"];

        //榜单
        _bangdan = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidBangDan withTitle:@"榜单"];

        //富豪
        _fuhao = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidFuhao withTitle:@"富豪"];

        //创业
        _chuangye = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidChuangYe withTitle:@"创业"];

        //科技
        _keji = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidKeJi withTitle:@"科技"];

        //商业
        _shangye = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidShangYe withTitle:@"商业"];

        //投资
        _touzi = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidTouZi withTitle:@"投资"];

        //城市
        _chengshi = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidChengShi withTitle:@"城市"];

        //生活
        _shenghuo = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidShengHuo withTitle:@"生活"];

        //图集
        _tuji = [[ChannelItemViewController alloc] initWithCoder:nil withCid:cidTuJi withTitle:@"图集"];

        //存放频道的数组
        _channelArray = [[NSArray alloc] initWithObjects:_todayController,_zhuanLan,_bangdan,_fuhao,_chuangye,_keji,_shangye,_touzi,_chengshi,_shenghuo,_tuji, nil];
        
        //频道cid
        _channelCid = [[NSArray alloc] initWithObjects:cidZhuanLan,cidBangDan,cidFuhao,cidChuangYe,cidKeJi,cidShangYe,cidTouZi,cidChengShi,cidShengHuo,cidTuJi, nil];
        
        //当前频道的索引
        _currentChannelIndex = 0;
        
        //详细页
        _detailController = [[DetailViewController alloc] initWithCoder:nil];
        
        //登录页
        _loginController = [[LoginViewController alloc] initWithCoder:nil];
        
        //注册页
        _resgisterController = [[ViewController alloc] initWithCoder:nil];
        
        //收藏页
        _favoriteController = [[FavoriteViewController alloc] initWithCoder:nil];
        
        //关于页
        _aboutController = [[AboutViewController alloc] initWithCoder:nil];
        
        //往期页
        _wangQiController = [[WangQiViewController alloc] initWithCoder:nil];
        
        //目录页
        _muluController = [[MuLuViewController alloc] initWithCoder:nil];
        
        //显示详细页的通知
        [self addAppearDetailViewNotification];
        
        //隐藏详细页的通知
        [self addHidenDetailViewNotification];
        
        //隐藏登录注册收藏之类的页面
        [self addHidenTopBarViewNotification];
        
        //显示注册页的通知
        [self addAppearRegisterViewNotification];
        
        //显示登陆页的通知
        [self addAppearLoginViewNotification];
        
        //显示收藏页的通知
        [self addAppearFavotieViewNotification];
        
        //显示往期页的通知
        [self addAppearWangQiViewNotification];
        
        //登陆成功后
        [self addLoginDoneViewNotification];
        
        //注册成功后
        [self addRegisterDoneViewNotification];
        
        //下一频道的通知
        [self addChageChannelNextNotification];
        
        //上一频道的通知
        [self addChageChannelLastNotification];
    }
    
    return self;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];

    _channelButtonArray = [[NSArray alloc] initWithObjects:_channelJinritoutian,_channelZhuanLan,_channelBangDan,_channelFuHao,_channelChuangYe,_channelKeJi,_channelShangYe,_channelTouZi,_channelChengShi,_channelShengHuo,_channelTuJi, nil];
    
    [self.view addSubview:_todayController.view];
    
    [self.view addSubview:_zhuanLan.view];
    _zhuanLan.view.hidden = YES;
    
    [self.view addSubview:_bangdan.view];
    _bangdan.view.hidden = YES;

    [self.view addSubview:_fuhao.view];
    _fuhao.view.hidden = YES;
    
    [self.view addSubview:_chuangye.view];
    _chuangye.view.hidden = YES;
    
    [self.view addSubview:_keji.view];
    _keji.view.hidden = YES;
    
    [self.view addSubview:_shangye.view];
    _shangye.view.hidden = YES;
    
    [self.view addSubview:_touzi.view];
    _touzi.view.hidden = YES;

    [self.view addSubview:_chengshi.view];
    _chengshi.view.hidden = YES;
    
    [self.view addSubview:_shenghuo.view];
    _shenghuo.view.hidden = YES;

    [self.view addSubview:_tuji.view];
    _tuji.view.hidden = YES;

    [self.view addSubview:_detailController.view];
    _detailController.view.hidden = YES;
    
    [self.view addSubview:_loginController.view];
    _loginController.view.hidden = YES;
    
    [self.view addSubview:_resgisterController.view];
    _resgisterController.view.hidden = YES;
    
    [self.view addSubview:_favoriteController.view];
    _favoriteController.view.hidden = YES;
    
    [self.view addSubview:_aboutController.view];
    _aboutController.view.hidden = YES;
    
    [self.view addSubview:_wangQiController.view];
    _wangQiController.view.hidden = YES;
    
    [self.view addSubview:_muluController.view];
    _muluController.view.hidden = YES;
    
    //默认是进入今日头条
    _channelJinritoutian.selected = YES;
    
    UISwipeGestureRecognizer *recognizer;
    
    //向上一频道翻的手势
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    
    [[self view] addGestureRecognizer:recognizer];
    
    //下一频道翻的手势
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _todayController.view.frame = CGRectMake(0, 100, 1024, 668);
    
    _zhuanLan.view.frame = CGRectMake(0, 100, 1024, 668);

    _bangdan.view.frame = CGRectMake(0, 100, 1024, 668);

    _fuhao.view.frame = CGRectMake(0, 100, 1024, 668);

    _chuangye.view.frame = CGRectMake(0, 100, 1024, 668);

    _keji.view.frame = CGRectMake(0, 100, 1024, 668);

    _shangye.view.frame = CGRectMake(0, 100, 1024, 668);

    _touzi.view.frame = CGRectMake(0, 100, 1024, 668);

    _chengshi.view.frame = CGRectMake(0, 100, 1024, 668);

    _shenghuo.view.frame = CGRectMake(0, 100, 1024, 668);

    _tuji.view.frame = CGRectMake(0, 100, 1024, 668);
    
    _detailController.view.frame = CGRectMake(0, 100, 1024, 668);

    _loginController.view.frame = CGRectMake(0, 50, 1024, 668);

    _resgisterController.view.frame = CGRectMake(0, 50, 1024, 668);

    _favoriteController.view.frame = CGRectMake(0, 50, 1024, 668);
    
    _aboutController.view.frame = CGRectMake(0, 50, 1024, 668);

    _wangQiController.view.frame = CGRectMake(0, 50, 1024, 668);

    _muluController.view.frame = CGRectMake(0, 50, 1024, 668);

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 左右滑动的手势

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        DLog(@"下一频道");
        //执行程序
        if (_currentChannelIndex==([_channelArray count]-1)) {
            
        }else
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ChageChannelNextNotification" object:nil];

        }
        
        
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        DLog(@"上一频道");
        //执行程序
        if (!_currentChannelIndex==0) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"ChageChannelLastNotification" object:nil];

        }
        
    }
    
}


#pragma mark - 下一频道执行动画的通知
- (void)addChageChannelNextNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"ChageChannelNextNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"ChageChannelNextNotification ********");
         
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             int index = _currentChannelIndex;
             
             //变换顶部频道按钮
             [self unselectAllButton];
             UIButton *currentButton = [_channelButtonArray objectAtIndex:_currentChannelIndex+1];
             currentButton.selected = YES;
             
             //请求数据
             NSString *cidStr = [_channelCid objectAtIndex:index];
             [TodayAPI getChannelNewsByID:cidStr];
             
             
             UIViewController *currentController = [_channelArray objectAtIndex:index];
             currentController.view.hidden = NO;
             
             UIViewController *nextController = [_channelArray objectAtIndex:index+1];
             CGRect frame = [nextController.view frame];
             frame.origin.x = 1024;
             [nextController.view setFrame: frame];
             nextController.view.hidden = NO;
             
             [UIView animateWithDuration:ChannelAnimationTime animations:^{
                 CGRect bounds = [currentController.view frame];
                 bounds.origin.x = -1024;
                 [currentController.view setFrame: bounds];
                 
                 
             }];
             
             [UIView animateWithDuration:ChannelAnimationTime animations:^{
                 
                 
                 CGRect boundsNext = [nextController.view frame];
                 boundsNext.origin.x = 0;
                 [nextController.view setFrame: boundsNext];
             }];
             
             _currentChannelIndex++;

         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChageChannelNextNotification" object:nil];

    
}

#pragma mark - 上一频道执行动画的通知
- (void)addChageChannelLastNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"ChageChannelLastNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"ChageChannelLastNotification ********");
         
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             int index = _currentChannelIndex;
             
             [self unselectAllButton];
             UIButton *currentButton = [_channelButtonArray objectAtIndex:_currentChannelIndex-1];
             currentButton.selected = YES;
             
             if (index>1) {
                 NSString *cidStr = [_channelCid objectAtIndex:index-2];
                 [TodayAPI getChannelNewsByID:cidStr];
             }
             
             
             UIViewController *currentController = [_channelArray objectAtIndex:index];
             currentController.view.hidden = NO;
             
             UIViewController *laseController = [_channelArray objectAtIndex:index-1];
             CGRect frame = [laseController.view frame];
             frame.origin.x = -1024;
             [laseController.view setFrame: frame];
             laseController.view.hidden = NO;
             
             [UIView animateWithDuration:ChannelAnimationTime animations:^{
                 CGRect bounds = [currentController.view frame];
                 bounds.origin.x = 1024;
                 [currentController.view setFrame: bounds];
                 
                 
             }];
             
             [UIView animateWithDuration:ChannelAnimationTime animations:^{
                 
                 
                 CGRect boundsNext = [laseController.view frame];
                 boundsNext.origin.x = 0;
                 [laseController.view setFrame: boundsNext];
             }];
             
             _currentChannelIndex--;
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChageChannelLastNotification" object:nil];
    
    
}


#pragma mark - 显示详细页得通知

- (void)addAppearDetailViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"AppearDetailViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"AppearDetailViewNotification ********");
         
         NSString *newsID = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             
             [TodayAPI getNewsContentByID:newsID];

             _detailController.contentID = newsID;

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
         DLog(@"HidenDetailViewNotification ********");
         
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
         DLog(@"HidenTopBarViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];
    
}

#pragma mark - 显示注册页面得通知

- (void)addAppearRegisterViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"AppearRegisterViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"AppearRegisterViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             _resgisterController.view.hidden = NO;

         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearRegisterViewNotification" object:nil];
    
}

#pragma mark - 显示登陆页面得通知

- (void)addAppearLoginViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"AppearLoginViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"AppearLoginViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             _loginController.view.hidden = NO;
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearLoginViewNotification" object:nil];
    
}

#pragma mark - 显示收藏页面得通知

- (void)addAppearFavotieViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"AppearFavotieViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"AppearFavotieViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             
             _favoriteController.view.hidden = NO;
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearFavotieViewNotification" object:nil];
    
}

#pragma mark - 显示往期页面得通知

- (void)addAppearWangQiViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"AppearWangQiViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"AppearWangQiViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             
             //获取往期列表
             [TodayAPI getWangqiList];
             
             _wangQiController.view.hidden = NO;
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearWangQiViewNotification" object:nil];
    
}

 
#pragma mark - 登陆成功后得通知

- (void)addLoginDoneViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"LoginDoneViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"LoginDoneViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginDoneViewNotification" object:nil];
    
}

#pragma mark - 注册成功后得通知

- (void)addRegisterDoneViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"RegisterDoneViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"RegisterDoneViewNotification ********");
         
         dispatch_async(dispatch_get_main_queue(), ^{
             [self hideTopBarView];
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterDoneViewNotification" object:nil];
    
}


//隐藏所有的页面
- (void)hideAllView
{
    _todayController.view.hidden = YES;
    _zhuanLan.view.hidden = YES;
    _bangdan.view.hidden = YES;
    _fuhao.view.hidden = YES;
    _chuangye.view.hidden = YES;
    _keji.view.hidden = YES;
    _shangye.view.hidden = YES;
    _touzi.view.hidden = YES;
    _chengshi.view.hidden = YES;
    _shenghuo.view.hidden = YES;
    _tuji.view.hidden = YES;


    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenDetailViewNotification" object:nil];

}

//隐藏登陆注册收藏目录等页面
- (void)hideTopBarView
{
    _loginController.view.hidden = YES;
    _resgisterController.view.hidden = YES;
    _favoriteController.view.hidden = YES;
    _aboutController.view.hidden = YES;
    _wangQiController.view.hidden = YES;
    _muluController.view.hidden = YES;
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
    DLog(@"jin ri tou tiao");
    _currentChannelIndex = 0;
    
    [TodayAPI getTodayHeadInformation];
    [TodayAPI getTodayThreeHeadInformation];
    [TodayAPI getTodayChannelInformation];
    [self hideAllView];
    
    _todayController.view.frame = CGRectMake(0, 100, 1024, 668);
    _todayController.view.hidden = NO;
    
    [self unselectAllButton];

    _channelJinritoutian.selected = YES;
    
}

#pragma mark - 专栏

- (IBAction)zhuanlan:(id)sender {
    DLog(@"zhuan lan");
    _currentChannelIndex = 1;
    [self hideAllView];
    [self unselectAllButton];
    _zhuanLan.view.frame = CGRectMake(0, 100, 1024, 668);
    _zhuanLan.view.hidden = NO;
    _channelZhuanLan.selected = YES;

    [TodayAPI getChannelNewsByID:cidZhuanLan];

}

#pragma mark - 榜单

- (IBAction)bangdan:(id)sender {
    DLog(@"bang dan");
    _currentChannelIndex = 2;
    
    [TodayAPI getChannelNewsByID:cidBangDan];
    
    [self hideAllView];
    
    _bangdan.view.frame = CGRectMake(0, 100, 1024, 668);
    _bangdan.view.hidden = NO;
    
    [self unselectAllButton];
    
    _channelBangDan.selected = YES;

}

#pragma mark - 富豪

- (IBAction)fuhao:(id)sender {
    DLog(@"fu hao");
    _currentChannelIndex = 3;
    
    [TodayAPI getChannelNewsByID:cidFuhao];

    [self hideAllView];
    
    _fuhao.view.frame = CGRectMake(0, 100, 1024, 668);
    _fuhao.view.hidden = NO;

    [self unselectAllButton];
    
    _channelFuHao.selected = YES;

}

#pragma mark - 创业

- (IBAction)chuangye:(id)sender {
    DLog(@"chuang ye");
    _currentChannelIndex = 4;
    
    [TodayAPI getChannelNewsByID:cidChuangYe];

    [self hideAllView];
    
    _chuangye.view.frame = CGRectMake(0, 100, 1024, 668);
    _chuangye.view.hidden = NO;

    [self unselectAllButton];
    
    _channelChuangYe.selected = YES;

}

#pragma mark - 科技

- (IBAction)keji:(id)sender {
    DLog(@"ke ji");
    _currentChannelIndex = 5;
    
    [TodayAPI getChannelNewsByID:cidKeJi];

    [self hideAllView];
    
    _keji.view.frame = CGRectMake(0, 100, 1024, 668);
    _keji.view.hidden = NO;

    [self unselectAllButton];
    
    _channelKeJi.selected = YES;

}

#pragma mark - 商业

- (IBAction)shangye:(id)sender {
    DLog(@"shang ye");
    _currentChannelIndex = 6;
    
    [TodayAPI getChannelNewsByID:cidShangYe];

    [self hideAllView];
    
    _shangye.view.frame = CGRectMake(0, 100, 1024, 668);
    _shangye.view.hidden = NO;

    [self unselectAllButton];
    
    _channelShangYe.selected = YES;
}

#pragma mark - 投资

- (IBAction)touzi:(id)sender {
    DLog(@"tou zi");
    _currentChannelIndex = 7;
    
    [TodayAPI getChannelNewsByID:cidTouZi];

    [self hideAllView];
    
    _touzi.view.frame = CGRectMake(0, 100, 1024, 668);
    _touzi.view.hidden = NO;

    [self unselectAllButton];
    
    _channelTouZi.selected = YES;

}

#pragma mark - 城市

- (IBAction)chengshi:(id)sender {
    DLog(@"sheng shi");
    _currentChannelIndex = 8;
    
    [TodayAPI getChannelNewsByID:cidChengShi];

    [self hideAllView];
    
    _chengshi.view.frame = CGRectMake(0, 100, 1024, 668);
    _chengshi.view.hidden = NO;

    [self unselectAllButton];
    
    _channelChengShi.selected = YES;

}

#pragma mark - 生活

- (IBAction)shenghuo:(id)sender {
    DLog(@"sheng huo");
    _currentChannelIndex = 9;
    
    [TodayAPI getChannelNewsByID:cidShengHuo];

    [self hideAllView];
    
    _shenghuo.view.frame = CGRectMake(0, 100, 1024, 668);
    _shenghuo.view.hidden = NO;

    [self unselectAllButton];
    
    _channelShengHuo.selected = YES;

}

#pragma mark - 图集

- (IBAction)tuji:(id)sender {
    DLog(@"tu ji");
    _currentChannelIndex = 10;
    
    [TodayAPI getChannelNewsByID:cidShengHuo];

    [self hideAllView];
    
    _tuji.view.frame = CGRectMake(0, 100, 1024, 668);
    _tuji.view.hidden = NO;

    [self unselectAllButton];
    
    _channelTuJi.selected = YES;

}

#pragma mark - 登录方法

- (IBAction)login:(id)sender {
    DLog(@"login ");
    
    [self hideTopBarView];
    
    _loginController.view.hidden = NO;
    
}

#pragma mark - about 页面 （方法名错了，不想改了）

- (IBAction)registerNumber:(id)sender {
    DLog(@"about ");
    
    [self hideTopBarView];
    
    _aboutController.view.hidden = NO;
    
    
}

#pragma mark - 收藏方法

- (IBAction)favoriteArticle:(id)sender {
    DLog(@"favorite  ");
    
    [self hideTopBarView];
    
    _favoriteController.view.hidden = NO;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"FavoriteNotification" object:nil];
   
}

#pragma mark - 回到首页

- (IBAction)backToHome:(id)sender {
    DLog(@"open home");
    
    [self hideAllView];
    [self hideTopBarView];
    [self unselectAllButton];

    _todayController.view.hidden = NO;      //今日头条显示
    
    _channelJinritoutian.selected = YES;
    
    
}

#pragma mark - 打开目录

- (IBAction)openMuLu:(id)sender {
    DLog(@"mulu  ");
    [TodayAPI getMuLuList];

    [self hideTopBarView];
    
    _muluController.view.hidden = NO;
    
}


@end
