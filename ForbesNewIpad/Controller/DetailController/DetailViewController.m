//
//  DetailViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    for (int i=1; i<5; i++) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0+1024*(i-1), 0, 1024, 699)];
        imageview.image = [UIImage imageNamed:[NSString stringWithFormat:@"IMG_08_%d.PNG",i]];
        [_mainScrollView addSubview:imageview];
    }
    
    _mainScrollView.contentSize = CGSizeMake(1024*4, 699);
    _mainScrollView.pagingEnabled = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
