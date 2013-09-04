//
//  WelcomeViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "WelcomeViewController.h"
#import "PagePhotosView.h"
#import "scenicCell.h"
#import "DetailViewController.h"
#import "UIViewController+SliderViewController.h"
#import "WeatherViewController.h"

@interface WelcomeViewController () <PagePhotosDataSource, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
- (void)myInit;
@end

@implementation WelcomeViewController
{
	PagePhotosView *pagePhotosView;
	NSArray *picInfo;
	NSArray *scenicName;
	NSString *scenicLabelName;
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
	self.navigationItem.leftBarButtonItem = weatherButtonItem;
	
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
	WeatherViewController *weatherView = [[WeatherViewController alloc] initWithNibName:@"WeatherViewController" bundle:nil];
	[self presentSliderViewController:weatherView animationType:SliderViewAnimationSliderL2R];
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
	static NSString *cellIdentifier = @"cell";
	scenicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[scenicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
//	scenicCell *cell = [[scenicCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	
	scenicLabelName = [[NSString alloc] initWithString:[scenicName objectAtIndex:indexPath.row]];
	cell.nameLabel.text = scenicLabelName;
	cell.imageView.image = [UIImage imageNamed:@"weather.png"];
	
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
	//进入界面隐藏tabbar
	detailViewController.hidesBottomBarWhenPushed = YES;
	NSString *detaileTitle = [[NSString alloc] initWithString:[scenicName objectAtIndex:indexPath.row]];
	[detailViewController setTitle:detaileTitle];
	//设置image
//	第几个cell对应第几个image
	//设置text
//	根据indexpath获取string并设置textView的string
	
	[self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
