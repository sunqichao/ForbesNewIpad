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

@property (nonatomic ,copy) NSString *selfcid;

@property (nonatomic ,copy) NSString *channelT;

@end

@implementation ChannelItemViewController

- (id)initWithCoder:(NSCoder*)coder withCid:(NSString *)cid withTitle:(NSString *)title
{
    
    if (self = [super initWithCoder:coder]) {
        
        self.selfcid = cid;
        self.channelT = title;
        
        //collectionview的布局文件
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        //初始化collectionview 并把cell一起初始化给它
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_collectionView registerClass:[ChannelItemCell class] forCellWithReuseIdentifier:@"ChannelItemCell"];
        [_collectionView setBackgroundColor:[UIColor clearColor]];
        
        //更新界面的通知
        [self addUpdateViewsNotification];
        
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
    
    self.channelTitle.text = _channelT;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    _collectionView.frame = CGRectMake(0, 350,1024, 350);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 更新界面的通知

- (void)addUpdateViewsNotification
{
    NSString *notificationName = [NSString stringWithFormat:@"PinDaoItemNotification%@",_selfcid];
    
    [NSNotificationCenter.defaultCenter addObserverForName:notificationName
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"PinDaoTouTiaoNotification ********");
         
         _dataSource = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if ([_dataSource count]>1) {
                 NSDictionary *dic = [_dataSource objectAtIndex:0];
                 NSString *urlstr = [SQC_StringUtility getTheRightURL:dic[@"img"]];
                 
                 [_mainImageView setImageWithURL:[NSURL URLWithString:urlstr] placeholderImage:[UIImage imageNamed:defaultImage]];
                 _newtitle.text = [SQC_StringUtility getTheRightContent:dic[@"title"]];
                 _description.text = [SQC_StringUtility getTheRightContent:dic[@"description"]];
                 
                 [_collectionView reloadData];
                 
             }else
             {
                 DLog(@"频道页数据出错");
             }
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"PinDaoItemNotification" object:nil];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [_dataSource count]-1;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ChannelItemCell";
    
    ChannelItemCell *cell = (ChannelItemCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    [cell setDataSource:[_dataSource objectAtIndex:indexPath.row+1]];

    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    return [[UICollectionReusableView alloc] init];
}

#pragma mark – UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(334, 220);
}

#pragma mark – 点击频道头条新闻

- (IBAction)clickChannelHeadLine:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:[_dataSource objectAtIndex:0][@"newsid"]];

}

#pragma mark – 点击频道新闻

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:[_dataSource objectAtIndex:indexPath.row+1][@"newsid"]];

    
}


@end
























