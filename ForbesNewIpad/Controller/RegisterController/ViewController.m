//
//  ViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-9.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithCoder:(NSCoder*)coder
{
    
    if (self =[super initWithCoder:coder]) {
        
        
    }
    
    return self;
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissView:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];

    [_email resignFirstResponder];
    [_nickName resignFirstResponder];
    [_keyword resignFirstResponder];
    [_sureKeyword resignFirstResponder];
}

- (IBAction)alreadyRegister:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearLoginViewNotification" object:nil];

    
}

- (IBAction)submitRegister:(id)sender {
    NSString *name = _email.text;
    NSString *keyword = _keyword.text;
    NSString *nick = _nickName.text;
    
    [TodayAPI registerWithUserName:name nickName:nick keyWord:keyword];
}
@end
