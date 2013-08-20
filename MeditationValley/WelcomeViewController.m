//
//  WelcomeViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "WelcomeViewController.h"
#import "PagePhotosView.h"



@interface WelcomeViewController () <PagePhotosDataSource, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
- (void)myInit;
@end

@implementation WelcomeViewController
{
	PagePhotosView *pagePhotosView;
	NSArray *picInfo;
	NSArray *scenicName;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		[self myInit];
    }
    return self;
}

- (void)myInit
{
	self.title = @"坐禅谷";
	picInfo = [[NSArray alloc] initWithObjects:@"1.jpg",@"2.jpg",@"3.jpg", nil];
	
	//导航栏天气按钮
	UIView *weatherButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
	UIImageView *homeButtonImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
	homeButtonImageView.image = [UIImage imageNamed:@"weather.png"];
	
	UIButton *homeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 40)];
	homeButton.backgroundColor = [UIColor clearColor];
	[homeButton addTarget:self action:@selector(weatherAlert) forControlEvents:UIControlEventTouchUpInside];
	[weatherButtonView addSubview:homeButtonImageView];
	[weatherButtonView addSubview:homeButton];
	
	UIBarButtonItem *weatherButtonItem = [[UIBarButtonItem alloc] initWithCustomView:weatherButtonView];
	self.navigationItem.rightBarButtonItem = weatherButtonItem;
	
	//获取tableview的数据
	NSString *path = [[NSBundle mainBundle] pathForResource:@"ScenicSpotInfo" ofType:@"plist"];
	NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
	scenicName = [[NSArray alloc] initWithArray:[dict objectForKey:@"ScenicName"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	//create pagePhtotsView
	pagePhotosView = [[PagePhotosView alloc]
					  initWithFrame:CGRectMake(0, 0, 320, 160)
					  withDataSource:self];
	
	//tableViewController
	//CGRect screenRect = [[UIScreen mainScreen] bounds];
	CGFloat tablehight = self.view.bounds.size.height-93;
	self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, tablehight) style:UITableViewStylePlain];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	self.tableView.bounces = NO;
	[self.view addSubview:self.tableView];
}

- (void)weatherAlert
{
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"weather" message:@"天气预报" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
	[alert show];
}

#pragma mark - pagePhotosViewDelegate
- (int)numberOfPages
{
	return [picInfo count];
}

- (UIImage *)imageAtIndex:(int)index
{
	NSString *picPath = [[[NSBundle mainBundle] bundlePath]stringByAppendingPathComponent:
						 [picInfo objectAtIndex:index]];
	UIImage *picImage = [[UIImage alloc] initWithContentsOfFile:picPath];
	return picImage;
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (section == 0) {
		return 0;
	}
	else
	{
	return [scenicName count];
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	if (section == 0) {
		return pagePhotosView.bounds.size.height;
	}
	else
		return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	if (section == 0) {
		return pagePhotosView;
	}
	else
		return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	
	NSString *string = [[NSString alloc] initWithString:[scenicName objectAtIndex:indexPath.row]];
	cell.textLabel.text = string;
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
