//
//  EverImpressViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "EverImpressViewController.h"
#import "HotScenicCell.h"
#import "HotData.h"

@interface EverImpressViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation EverImpressViewController
{
	NSArray *hotInfoArray;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = @"导游";
		
		//tableview数据源
		NSString *path = [[NSBundle mainBundle]
						  pathForResource:@"ScenicSpotInfo" ofType:@"plist"];
		NSDictionary *dict = [[NSDictionary alloc]initWithContentsOfFile:path];
		
		hotInfoArray = [[NSArray alloc] initWithArray:
						[dict objectForKey:@"HotScenicInfo"]];
		NSLog(@"%@", hotInfoArray);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	CGRect viewRect = self.view.frame;
	self.tableView = [[UITableView alloc]
					  initWithFrame:viewRect style:UITableViewStylePlain];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	
	[self.view addSubview:self.tableView];
}



#pragma mark - delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	return [hotInfoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"CEllIdentifier";
	HotScenicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
	cell = [[HotScenicCell alloc]
							 initWithStyle:UITableViewCellStyleDefault
							 reuseIdentifier:@"cell"];
	}
	[cell setAccessoryType:UITableViewCellAccessoryNone];
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	
	NSArray *data = [hotInfoArray objectAtIndex:indexPath.row];
	//显示name
	HotData *hotData = [[HotData alloc]initWithArray:data];
	[cell setData:hotData];
	
	return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 281;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
