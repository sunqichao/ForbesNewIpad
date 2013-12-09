//
//  DetailViewController.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *contentTextView;

@property (nonatomic ,copy) NSString *contentID;

- (IBAction)closeCurrentWindow:(id)sender;

- (void)getContentData;

@end
