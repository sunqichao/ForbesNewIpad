//
//  MainViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "MainViewController.h"
#import "TodayViewController.h"
#define animationTime 1.0

@interface MainViewController ()

@property (nonatomic ,strong) TodayViewController *todayController;

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

    [self.view addSubview:_todayController.view];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"IMG_0881.PNG"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)jinrijiaodian:(id)sender {
    
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0881_1.PNG"];
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view bringSubviewToFront:_todayController.view];
        
    });
    
    
    
}

- (IBAction)kaiquan:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0882.PNG"];
    }];
}

- (IBAction)zhuanlan:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0883.PNG"];
    }];
}

- (IBAction)texie:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0884.PNG"];
    }];
}

- (IBAction)quanqiujingji:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0885.PNG"];
    }];
}

- (IBAction)gongsiyuchanye:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0886.PNG"];
    }];
}

- (IBAction)zhengzhiyuzhengce:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0887.PNG"];
    }];
}

- (IBAction)keji:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0888.PNG"];
    }];
}

- (IBAction)shichangyujinrong:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0889.PNG"];
    }];
}

- (IBAction)zhiqushenghuo:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0890.PNG"];
    }];
}

- (IBAction)shipin:(id)sender {
    [UIView animateWithDuration:animationTime animations:^{
        self.backgroundImage.image = [UIImage imageNamed:@"IMG_0891.PNG"];
    }];
}
@end
