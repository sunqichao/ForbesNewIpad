//
//  ChannelItemViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-2.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "ChannelItemViewController.h"
#import "ChannelItemCell.h"
@interface ChannelItemViewController ()

@property (nonatomic ,retain) NSArray *dataSource;

@end

@implementation ChannelItemViewController

- (id)initWithCoder:(NSCoder*)coder

{
    
    if (self =[super initWithCoder:coder]) {
        
       
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [_dataSource count];
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChannelItemCell";
    ChannelItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    if (!cell)
    {
        cell = (ChannelItemCell *)[ChannelItemCell cellFromNibNamed:NSStringFromClass([ChannelItemCell class])];
        
 
    }
    
    
    [cell setDataSource:[_dataSource objectAtIndex:indexPath.row]];

    return cell;
}

@end
