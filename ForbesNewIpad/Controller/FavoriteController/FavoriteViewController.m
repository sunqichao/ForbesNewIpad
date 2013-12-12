//
//  FavoriteViewController.m
//  ForbesNewIpad
//
//  Created by sun qichao on 13-12-9.
//  Copyright (c) 2013年 sun qichao. All rights reserved.
//

#import "FavoriteViewController.h"
#import "FavoriteCell.h"
#import "FavoriteNewsEntity.h"
@interface FavoriteViewController ()

@property (nonatomic ,retain) NSArray *dataSource;

@end

@implementation FavoriteViewController

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
    [self addFavoriteNotification];
}
#pragma mark - 更新频道头条新闻得通知

- (void)addFavoriteNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"FavoriteNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"FavoriteNotification ********");
         
         _dataSource = [CoreDataManager getFavotieList];
         
         dispatch_async(dispatch_get_main_queue(), ^{
             if ([_dataSource count]>0) {
                 [_mainTableview reloadData];
                 
             }else
             {
                 NSLog(@"favorite 列表出错");
             }
             
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"FavoriteNotification" object:nil];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissView:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];

    
}

- (IBAction)appearWangQi:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearWangQiViewNotification" object:nil];

    
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
    return 75.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"JinritoutiaoCell";
    FavoriteCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = (FavoriteCell *)[FavoriteCell cellFromNibNamed:NSStringFromClass([FavoriteCell class])];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setDataSource:[_dataSource objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FavoriteNewsEntity *data = [_dataSource objectAtIndex:indexPath.row];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"AppearDetailViewNotification" object:data.newsId];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HidenTopBarViewNotification" object:nil];

    
}















@end
