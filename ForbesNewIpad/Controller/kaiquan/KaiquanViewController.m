//
//  KaiquanViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "KaiquanViewController.h"
#import "DetailViewController.h"
@interface KaiquanViewController ()
@property (nonatomic ,strong) DetailViewController *detailView;
@property (nonatomic ,strong) UIButton *closeButton;
@end

@implementation KaiquanViewController

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
    // Do any additional setup after loading the view from its nib.
    _detailView = [[DetailViewController alloc] init];
    _detailView.view.frame = CGRectMake(0, -50, 1024, 699);
    [self.view addSubview:_detailView.view];

    _detailView.view.hidden = YES;
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_closeButton setBackgroundColor:[UIColor clearColor]];
    [_closeButton setFrame:CGRectMake(1024-50, 600, 50, 50)];
    [_closeButton addTarget:self  action:@selector(closeMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_closeButton];
}

- (void)closeMethod:(id)sender
{
    NSLog(@"close");
    _detailView.view.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)gotoTheDetailView:(id)sender {
    NSLog(@"kaiquan");
    _detailView.mainScrollView.contentOffset = CGPointMake(0, 0);
    _detailView.view.hidden = NO;
    
}


@end
