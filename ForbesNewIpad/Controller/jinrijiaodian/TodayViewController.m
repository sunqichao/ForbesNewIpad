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

@interface TodayViewController ()

@property (nonatomic ,strong) NSDictionary *headlineData;

@property (nonatomic ,strong) NSArray *threeHeadlineData;

@property (nonatomic ,strong) NSArray *channelHeadlineData;

@end

@implementation TodayViewController

- (id)initWithCoder:(NSCoder*)coder

{
    
    if (self =[super initWithCoder:coder]) {
        
        _channelHeadlineData = [NSArray array];
        
        _threeHeadlineData = [NSArray array];
        
        _headlineData = [[NSDictionary alloc] init];
        
        
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
             
             _headLabel.text = _headlineData[headTextKey]?_headlineData[headTextKey]:@"";
             
             _headDetailLabel.text = _headlineData[headDetailTextKey]?_headlineData[headDetailTextKey]:@"";

             
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
             [_channelNewsTable reloadData];

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
    
    if ([_channelHeadlineData count]>2) {
        [cell setDataSource:[_channelHeadlineData objectAtIndex:indexPath.row]];

    }
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    

}



- (IBAction)clickHeadLine:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:_headlineData[@"newsid"]];
 
    
}

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
