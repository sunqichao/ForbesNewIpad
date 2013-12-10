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

        _title = [[UILabel alloc] initWithFrame:CGRectZero];
        _title.textColor = [UIColor blackColor];
        _title.font = [UIFont systemFontOfSize:18.0f];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.backgroundColor = [UIColor clearColor];
        [self addSubview:_title];
        
        _detail = [[UILabel alloc] initWithFrame:CGRectZero];
        _detail.textColor = [UIColor grayColor];
        _detail.font = [UIFont systemFontOfSize:14.0f];
        _detail.textAlignment = NSTextAlignmentLeft;
        _detail.backgroundColor = [UIColor clearColor];
        _detail.lineBreakMode = NSLineBreakByCharWrapping;
        _detail.numberOfLines = 2;
        [self addSubview:_detail];
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(290, 14, 33, 33)];
        imgView.image = [UIImage imageNamed:@"iconPlay.png"];
        imgView.backgroundColor = [UIColor clearColor];
        [self addSubview:imgView];
        
        UIImageView *imgViewTop = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 8)];
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
    
    _title.frame = CGRectMake(20, 20, 280, 20);
    _detail.frame = CGRectMake(20, 55, 300, 50);
    
}

- (void)setDataSource:(id)dataSource
{
    NSDictionary *datasource = (NSDictionary *)dataSource;
    
//    self.title.text = datasource[@"title"];
//    self.detail.text = datasource[@"detail"];
    
    self.title.text = @"mei de mei de mei de ";
    self.detail.text = @"mei de mei de mei de detaile mei de detaile mei de detail";
}


@end
