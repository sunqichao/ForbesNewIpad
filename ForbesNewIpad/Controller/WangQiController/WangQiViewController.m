//
//  WangQiViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-11.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "WangQiViewController.h"

@interface WangQiViewController ()

@end

@implementation WangQiViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)appearFavorite:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearFavotieViewNotification" object:nil];

}

- (IBAction)dismissView:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];
    
}



@end
