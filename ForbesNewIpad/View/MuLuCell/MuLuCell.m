//
//  MuLuCell.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-12.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "MuLuCell.h"

@implementation MuLuCell

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


}


+ (MuLuCell *)cellFromNibNamed:(NSString *)nibName
{
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:NULL];
    NSEnumerator *nibEnumerator = [nibContents objectEnumerator];
    MuLuCell *customCell = nil;
    NSObject* nibItem = nil;
    while ((nibItem = [nibEnumerator nextObject]) != nil)
    {
        if ([nibItem isKindOfClass:[MuLuCell class]])
        {
            customCell = (MuLuCell *)nibItem;
            break;
        }
    }
    return customCell;
}

@end
