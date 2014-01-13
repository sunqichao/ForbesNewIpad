//
//  MuLuViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-12.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "MuLuViewController.h"
#import "MuLuCell.h"
#import "MuLuView.h"

@interface MuLuViewController ()

@property (nonatomic ,retain) NSArray *dataSource;

@property (nonatomic ,retain) NSArray *channelName;

@end

@implementation MuLuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addMuLuNotification];
    _channelName = [NSArray arrayWithObjects:@"专栏",@"榜单",@"富豪",@"创业",@"科技",@"商业",@"投资",@"城市",@"生活", nil];
    _mainTableView.backgroundColor = [UIColor clearColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 更新目录得通知

- (void)addMuLuNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"MuLuNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"MuLuNotification ********");
         
         _dataSource = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if ([_dataSource count]>0) {
                 [_mainTableView reloadData];
                 
             }else
             {
                 DLog(@"mu lu 列表出错");
             }
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"MuLuNotification" object:nil];
    
}


- (IBAction)dismissView:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];

}

- (UIView *)getHeaderView
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 295, 42)];
    
    return header;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 9;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    MuLuView *head = [MuLuView cellFromNibNamed:@"MuLuSection"];
    [head setDataSource:[_channelName objectAtIndex:section]];
    return head;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 57.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MuLuCell";
    MuLuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = (MuLuCell *)[MuLuCell cellFromNibNamed:NSStringFromClass([MuLuCell class])];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setDataSource:[[_dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
@end
