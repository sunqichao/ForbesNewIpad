//
//  ChannelItemViewController.h
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-2.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelItemViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *description;
@property (weak, nonatomic) IBOutlet UILabel *newtitle;
@property (weak, nonatomic) IBOutlet UILabel *channelTitle;


- (id)initWithCoder:(NSCoder*)coder withCid:(NSString *)cid withTitle:(NSString *)title;

- (IBAction)clickChannelHeadLine:(id)sender;


@end
