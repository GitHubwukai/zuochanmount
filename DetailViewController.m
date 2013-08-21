//
//  DetailViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-21.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic ,strong) UIScrollView *scrollView;
- (void)myInit;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		[self myInit];
		
    }
    return self;
}


- (void)myInit
{

	
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	//[self.view setBackgroundColor:[UIColor colorWithRed:0.7 green:0.4 blue:0.1 alpha:1]];
	self.detailImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
	self.detailImage.image = [UIImage imageNamed:@"1.jpg"];
	self.detailText = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];

	self.detailText.text = @"n\n\n\n\n\n\n\n\n\n\n\n\n\n1234\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n567890";
	
	[self.detailText addSubview:self.detailImage];
	
	[self.view addSubview:self.detailText];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
