//
//  LoginViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-6.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

- (IBAction)dismissview:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];

    
}
@end
