//
//  MuLuView.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-16.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "MuLuView.h"

@implementation MuLuView

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
    NSString *channel = (NSString *)dataSource;
    _title.text = channel;
    
}

+ (MuLuView *)cellFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    MuLuView *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[MuLuView class]])
        {
            customCell = (MuLuView *)nibItem;
            break;
        }
    }
    return customCell;
}

@end
