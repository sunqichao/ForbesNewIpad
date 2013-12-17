//
//  WangQiCell.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-16.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "WangQiCell.h"

@implementation WangQiCell

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
    NSDictionary *dic = (NSDictionary *)dataSource;

    [_mainView setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"img_src_list"]] placeholderImage:[UIImage imageNamed:defaultImage]];
    _title.text = [dic objectForKey:@"title"];
    
}

+ (WangQiCell *)cellFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    WangQiCell *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[WangQiCell class]])
        {
            customCell = (WangQiCell *)nibItem;
            break;
        }
    }
    return customCell;
}
@end
