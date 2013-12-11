//
//  TodayViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-11-21.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "TodayViewController.h"
#import "JinritoutiaoCell.h"
#import "HeadNewsEntity.h"
#import "TodayAPI.h"
#import "ChannelNewsListEntity.h"
@interface TodayViewController ()

@property (nonatomic ,strong) NSDictionary *headlineData;

@property (nonatomic ,strong) NSArray *threeHeadlineData;

@property (nonatomic ,strong) NSArray *channelHeadlineData;

@end

@implementation TodayViewController

- (id)initWithCoder:(NSCoder*)coder

{
    
    if (self =[super initWithCoder:coder]) {
        
        //每个频道头条新闻数组
        _channelHeadlineData = [NSArray array];
        
        //三条当天头条新闻
        _threeHeadlineData = [NSArray array];
        
        //今日头条的数据
        _headlineData = [[NSDictionary alloc] init];
        
        //添加更新界面的通知
        [self addTouTiaoNotification];
        [self addTouTiaoThreeNotification];
        [self addPinDaoTouTiaoNotification];
        
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.channelNewsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //发起请求
    [TodayAPI getTodayHeadInformation];
    [TodayAPI getTodayThreeHeadInformation];
    [TodayAPI getTodayChannelInformation];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 更新头条新闻得通知

- (void)addTouTiaoNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"TouTiaoNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"TouTiaoNotification ********");
         _headlineData = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
            
             [_headImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.forbeschina.com%@",_headlineData[headImageURLKey]]] placeholderImage:[UIImage imageNamed:@"scrollView_3.png"]];
             
             _headLabel.text = _headlineData[headTextKey]?_headlineData[headTextKey]:@"没有数据啊";
             
             _headDetailLabel.text = _headlineData[headDetailTextKey]?_headlineData[headDetailTextKey]:@"还是没数据";

             
         });
         
     }];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"TouTiaoNotification" object:nil];

    
}

#pragma mark - 更新头条新闻相关三篇新闻得通知

- (void)addTouTiaoThreeNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"TouTiaoThreeNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"TouTiaoThreeNotification ********");

         _threeHeadlineData = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if ([_threeHeadlineData count]==3) {
                 _firstLabel.text = [_threeHeadlineData objectAtIndex:0][TextKey];
                 
                 _secondLabel.text = [_threeHeadlineData objectAtIndex:1][TextKey];
                 
                 _thirdLabel.text = [_threeHeadlineData objectAtIndex:2][TextKey];
             }else
             {
                 NSLog(@"今日头三条出错");
             }
             
             
         });
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"TouTiaoThreeNotification" object:nil];
    
    
}

#pragma mark - 更新频道头条新闻得通知

- (void)addPinDaoTouTiaoNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"PinDaoTouTiaoNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"PinDaoTouTiaoNotification ********");
         
         _channelHeadlineData = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if ([_channelHeadlineData count]>5) {
                 [_channelNewsTable reloadData];

             }else
             {
                 NSLog(@"频道头条列表出错");
             }

         });
         
         
     }];
    
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"PinDaoTouTiaoNotification" object:nil];

}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_channelHeadlineData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JinritoutiaoCell";
    JinritoutiaoCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = (JinritoutiaoCell *)[JinritoutiaoCell cellFromNibNamed:NSStringFromClass([JinritoutiaoCell class])];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setDataSource:[_channelHeadlineData objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - 点击频道头条

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChannelNewsListEntity *data = [_channelHeadlineData objectAtIndex:indexPath.row];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:data.newsid];

    

}

#pragma mark - 点击今日头条

- (IBAction)clickHeadLine:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:_headlineData[@"newsid"]];
 
    
}

#pragma mark - 点击今日头三条

- (IBAction)clickFirstNews:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:[_threeHeadlineData objectAtIndex:0][@"newsid"]];

    
}

- (IBAction)clickSecondNews:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:[_threeHeadlineData objectAtIndex:1][@"newsid"]];

    
}

- (IBAction)clcikThirdNews:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:[_threeHeadlineData objectAtIndex:2][@"newsid"]];

    
}
@end
