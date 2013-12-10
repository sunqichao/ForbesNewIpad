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

@property (nonatomic ,retain) UICollectionView *collectionView;

@end

@implementation ChannelItemViewController

- (id)initWithCoder:(NSCoder*)coder

{
    
    if (self =[super initWithCoder:coder]) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_collectionView registerClass:[ChannelItemCell class] forCellWithReuseIdentifier:@"ChannelItemCell"];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        

         [self.view addSubview:_collectionView];
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:_collectionView];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self arrangeCollectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _collectionView.frame = CGRectMake(0, 300,1024, 350);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//调节collectionview的横竖布局
- (void)arrangeCollectionView {
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
    if (UIInterfaceOrientationIsPortrait(self.interfaceOrientation)) {
        flowLayout.scrollDirection =  UICollectionViewScrollDirectionVertical;
    } else {
        flowLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
    }
    flowLayout.scrollDirection =  UICollectionViewScrollDirectionVertical;

    _collectionView.collectionViewLayout = flowLayout;
    [_collectionView reloadData];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [_dataSource count]+6;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChannelItemCell";
    ChannelItemCell *cell = (ChannelItemCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    
    [cell setDataSource:[_dataSource objectAtIndex:indexPath.row]];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    return [[UICollectionReusableView alloc] init];
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(334, 160);
}

@end
