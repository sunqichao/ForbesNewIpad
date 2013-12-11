//
//  LoginViewController.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-6.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *keyword;

- (IBAction)dismissview:(id)sender;


- (IBAction)dismissKeyboard:(id)sender;

- (IBAction)registerFree:(id)sender;

- (IBAction)login:(id)sender;

@end
