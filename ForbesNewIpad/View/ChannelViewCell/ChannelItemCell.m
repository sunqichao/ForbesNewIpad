//
//  ChannelItemCell.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-9.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "ChannelItemCell.h"

@implementation ChannelItemCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        _channel = [[UILabel alloc] initWithFrame:CGRectZero];
        _channel.textColor = [UIColor grayColor];
        _channel.font = [UIFont systemFontOfSize:12.0f];
        _channel.textAlignment = NSTextAlignmentLeft;
        _channel.backgroundColor = [UIColor clearColor];
        _channel.lineBreakMode = NSLineBreakByCharWrapping;
        _channel.numberOfLines = 5;
        [self addSubview:_channel];
        
        
        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.textColor = [UIColor blackColor];
        _title.font = [UIFont systemFontOfSize:18.0f];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.backgroundColor = [UIColor clearColor];
        _title.lineBreakMode = NSLineBreakByWordWrapping;
        _title.numberOfLines = 1;
        [self addSubview:_title];
        

        _detail = [[UILabel alloc] initWithFrame:CGRectZero];
        _detail.textColor = [UIColor grayColor];
        _detail.font = [UIFont systemFontOfSize:14.0f];
        _detail.textAlignment = NSTextAlignmentLeft;
        _detail.backgroundColor = [UIColor clearColor];
        _detail.lineBreakMode = NSLineBreakByCharWrapping;
        _detail.numberOfLines = 3;
        [self addSubview:_detail];
        
        
        _imageview = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageview.image = [UIImage imageNamed:defaultImage];
        _imageview.backgroundColor = [UIColor clearColor];
        [self addSubview:_imageview];
        
        UIImageView *imgViewTop = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 310, 6)];
        imgViewTop.image = [UIImage imageNamed:@"ContactTitleBorder.png"];
        imgViewTop.backgroundColor = [UIColor clearColor];
        [self addSubview:imgViewTop];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)layoutSubviews
{
    [super layoutSubviews];
    _channel.frame = CGRectMake(20, 0, 260, 13);
    _title.frame = CGRectMake(20, 25, 260, 20);
    _detail.frame = CGRectMake(90, 45, 220, 70);
    _imageview.frame = CGRectMake(20, _detail.frame.origin.y+10, 60, 60);
}

- (void)setDataSource:(id)dataSource
{
    NSDictionary *datasource = (NSDictionary *)dataSource;
    self.channel.text = @"频道名字";
    self.title.text = [SQC_StringUtility getTheRightContent:datasource[@"title"]];
    self.detail.text = [SQC_StringUtility getTheRightContent:datasource[@"description"]];
    [self.imageview setImageWithURL:[NSURL URLWithString:[SQC_StringUtility getTheRightURL:datasource[@"img"]]] placeholderImage:[UIImage imageNamed:defaultImage]];
    
    
//    self.title.text = @"mei de mei de mei de ";
//    self.detail.text = @"mei de mei de mei de detaile mei de detaile mei de detail";
}


@end
