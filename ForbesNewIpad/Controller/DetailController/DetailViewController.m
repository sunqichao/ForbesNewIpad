//
//  DetailViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "DetailViewController.h"
#import "ASIFormDataRequest.h"
#import "AKOMultiPageTextView.h"
#import "PageController.h"
@interface DetailViewController ()
@property (nonatomic, retain) PageController *contentPage;

@end

@implementation DetailViewController

- (id)initWithCoder:(NSCoder*)coder

{
    
    if (self =[super initWithCoder:coder]) {
        
        _contentPage = [[PageController alloc] init];
                
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    [_contentTextView addSubview:_contentPage.view];
    
    [self.view addSubview:_contentPage.view];
    
}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _contentPage.view.frame = CGRectMake(0, 0, 1024, 630);
    _contentPage.multiPageView.frame = CGRectMake(0, 45, 1024, 622);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - 关闭的通知

- (IBAction)closeCurrentWindow:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenDetailViewNotification" object:nil];
    
    
}

#pragma mark - 获取新闻内容数据
- (void)getContentData
{
    [TodayAPI getNewsContentByID:_contentID];


}

@end
