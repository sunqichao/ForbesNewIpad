//
//  TodayViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "TodayViewController.h"
@interface TodayViewController ()

@end

@implementation TodayViewController

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
    
    EScrollerView *scroller=[[EScrollerView alloc]
                             initWithFrameRect:CGRectMake(20, 172, 662, 389)
                                    ImageArray:@[@"scrollview_1.png",@"scrollview_2.png",@"scrollView_3.png",@"scrollView_4.png"]
                                    TitleArray:nil];
    scroller.delegate=self;
    [self.view addSubview:scroller];
    
}
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"index--%d",index);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
