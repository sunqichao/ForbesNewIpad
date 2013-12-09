//
//  JinritoutiaoCell.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-2.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "JinritoutiaoCell.h"
#import "ChannelNewsListEntity.h"
#import "UIImageView+WebCache.h"
@implementation JinritoutiaoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDataSource:(id)dataSource
{
    ChannelNewsListEntity *data = (ChannelNewsListEntity *)dataSource;
    
    _channelName.text = data.channelName;
    
    [_mainImageView setImageWithURL:[NSURL URLWithString:data.mainImage] placeholderImage:[UIImage imageNamed:@"scrollView_3.png"]];
    
    _titleLabel.text = data.titleText;
    
    _titleDetailLabel.text = data.titleDetailText;
    
}

+ (JinritoutiaoCell *)cellFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    JinritoutiaoCell *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[JinritoutiaoCell class]])
        {
            customCell = (JinritoutiaoCell *)nibItem;
            break;
        }
    }
    return customCell;
}

@end
