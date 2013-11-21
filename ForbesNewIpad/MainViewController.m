//
//  MainViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "MainViewController.h"
#import "TodayViewController.h"
#import "KaiquanViewController.h"
#define animationTime 1.0

@interface MainViewController ()

@property (nonatomic ,strong) TodayViewController *todayController;
@property (nonatomic ,strong) KaiquanViewController *kaiquanController;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _todayController = [[TodayViewController alloc] init];
    _todayController.view.frame = CGRectMake(0, 118, 1024, 653);
    [self.view addSubview:_todayController.view];
    
    _kaiquanController = [[KaiquanViewController alloc] init];
    _kaiquanController.view.frame = CGRectMake(0, 118, 1024, 653);
    [self.view addSubview:_kaiquanController.view];
    _kaiquanController.view.hidden = YES;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"IMG_0881.PNG"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jinrijiaodian:(id)sender {
    
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0881_1_1.png"];
    }];
    [self hideAllView];
    _kaiquanController.view.hidden = YES;
    _todayController.view.hidden = NO;
}

- (IBAction)kaiquan:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0882.PNG"];
    }];
    [self hideAllView];
    
}

- (IBAction)zhuanlan:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0883.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)texie:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0884.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)quanqiujingji:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0885.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)gongsiyuchanye:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0886.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)zhengzhiyuzhengce:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0887.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)keji:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0888.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)shichangyujinrong:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0889.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)zhiqushenghuo:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0890.PNG"];
    }];
    [self hideAllView];

}

- (IBAction)shipin:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0891.PNG"];
    }];
    [self hideAllView];

}

- (void)hideAllView
{
    _todayController.view.hidden = YES;
    _kaiquanController.view.hidden = NO;
}

@end
