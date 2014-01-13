//
//  WangQiViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-11.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "WangQiViewController.h"
#import "WangQiCell.h"
@interface WangQiViewController ()

@property (nonatomic ,strong) NSArray *dataSource;

@end

@implementation WangQiViewController

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
    [self addWangQiNotification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 更薪往期得通知

- (void)addWangQiNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"WangQiNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         DLog(@"WangQiNotification ********");
         
         _dataSource = [note object];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if ([_dataSource count]>0) {
                 [_wangqiTableView reloadData];
                 
             }else
             {
                 DLog(@"wangqi 列表出错");
             }
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"WangQiNotification" object:nil];
    
}


- (IBAction)appearFavorite:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearFavotieViewNotification" object:nil];
    
}

- (IBAction)dismissView:(id)sender {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];
    
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
    return [_dataSource count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JinritoutiaoCell";
    WangQiCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = (WangQiCell *)[WangQiCell cellFromNibNamed:NSStringFromClass([WangQiCell class])];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setDataSource:[_dataSource objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


@end
