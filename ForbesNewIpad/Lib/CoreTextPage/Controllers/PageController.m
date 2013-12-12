//
//  PageController.m
//  CoreTextWrapper
//
//  Created by Adrian on 7/8/10.
//  Copyright 2010 akosma software. All rights reserved.
//

#import "PageController.h"
#import "AKOMultiPageTextView.h"
#import "NSString+BundleExtensions.h"
#import "UIFont+CoreTextExtensions.h"
@interface PageController ()

@property (nonatomic) CGFloat previousScale;
@property (nonatomic) CGFloat fontSize;
@property (nonatomic ,retain) UIView *imageview;
@property (nonatomic ,retain) ArticleContentEntity *dataDiction;
@end


@implementation PageController

@synthesize multiPageView = _multiPageView;
@synthesize label = _label;
@synthesize previousScale = _previousScale;
@synthesize fontSize = _fontSize;

- (void)dealloc
{
    self.label = nil;
    self.multiPageView = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.label.text = @"福布斯美国慈善英雄榜：谁捐的钱最多？";
    self.label.font = [UIFont fontWithName:@"Polsku" size:34.0];
    self.label.shadowColor = [UIColor lightGrayColor];
    self.label.shadowOffset = CGSizeMake(2, 2);
    
    
    self.fontSize = 24.0;
    self.multiPageView.backgroundColor = [UIColor clearColor];
    self.multiPageView.dataSource = self;
    self.multiPageView.columnInset = CGPointMake(20, 30);
    self.multiPageView.text = @"afajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkafajlsdkfjlaskdjfl;kasjdflkajsd;kfjalkdfjlaskdjflaksjdflksdjflkajsdflaksjflkflk";
    self.multiPageView.font = [UIFont fontWithName:@"Georgia" size:self.fontSize];
    self.multiPageView.columnCount = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 2 : 2;
 
    UIPinchGestureRecognizer *pinchRecognizer = [[[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(changeTextSize:)] autorelease];
    [self.multiPageView addGestureRecognizer:pinchRecognizer];
    
    [self addUpdateXinWenViewNotification];
}

- (UIView*)akoMultiColumnTextView:(AKOMultiColumnTextView*)textView viewForColumn:(NSInteger)column onPage:(NSInteger)page
{
    if (page == 0 && column == 1)
    {
        UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 300)] autorelease];
        UIImageView *image = [[UIImageView alloc] initWithFrame:view.frame];
        if (_dataDiction) {
            NSString *imageUrl = [NSString stringWithFormat:@"http://www.forbeschina.com%@",_dataDiction.photoSrc];
            NSURL *url = [NSURL URLWithString:imageUrl];
            
            [image setImageWithURL:url placeholderImage:[UIImage imageNamed:@"scrollView_3.png"]];
            
        }else
        {
            image.image = [UIImage imageNamed:@"0x600 (5)(2).jpg"];

        }
        [view addSubview:image];
        self.imageview = view;
        [image release];
        view.backgroundColor = [UIColor clearColor];
        return view;
    }
    
    return nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        self.multiPageView.columnCount = 2;
        self.imageview.frame = CGRectMake(0, 0, 300, 200);
        self.imageview.hidden = YES;
    }
    else
    {
        self.multiPageView.columnCount = 2;
        self.imageview.frame = CGRectMake(0, 0, 250, 200);
        self.imageview.hidden = YES;
        
        
    }
    [self.multiPageView setNeedsDisplay];
    [self.label setNeedsDisplay];
}

#pragma mark -
#pragma mark Gesture recognizer methods

- (void)changeTextSize:(UIPinchGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateBegan)
    {
        self.previousScale = recognizer.scale;
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        if (recognizer.scale > self.previousScale)
        {
            if (self.fontSize < 48.0)
            {
                self.fontSize += 0.25;
            }
        }
        else
        {
            if (self.fontSize > 12.0)
            {
                self.fontSize -= 0.25;
            }
        }
        
        self.multiPageView.font = [UIFont fontWithName:@"Georgia" size:self.fontSize];
        self.previousScale = recognizer.scale;
    }
}
#pragma mark - 更新新闻阅读页得通知

- (void)addUpdateXinWenViewNotification
{
    [NSNotificationCenter.defaultCenter addObserverForName:@"UpdateXinWenViewNotification"
                                                    object:nil
                                                     queue:nil
                                                usingBlock:^(NSNotification *note)
     {
         NSLog(@"UpdateXinWenViewNotification ********");
         ArticleContentEntity *article = [note object];
         self.pageData = article;
         dispatch_async(dispatch_get_main_queue(), ^{
             self.dataDiction = article;
             self.label.text = article.title;
             self.multiPageView.text = article.content;
             [self.multiPageView setNeedsDisplay];
             [self.label setNeedsDisplay];
            
         });
         
         
     }];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateXinWenViewNotification" object:nil];
    
}

@end

