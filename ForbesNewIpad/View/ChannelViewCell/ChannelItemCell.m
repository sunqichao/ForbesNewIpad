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

- (void)setDataSource:(id)dataSource
{
    
    
}

+ (ChannelItemCell *)cellFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    ChannelItemCell *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[ChannelItemCell class]])
        {
            customCell = (ChannelItemCell *)nibItem;
            break;
        }
    }
    return customCell;
}
@end
