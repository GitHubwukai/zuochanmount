//
//  HelpViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "HelpViewController.h"
#import "FunActivity.h"

@interface HelpViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIBarButtonItem *takePicture;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *weiboButton;
@property (nonatomic, strong) UILabel *factTextLabel;
@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = @"帮助";
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	self.takePicture = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(getPic)];
	[self.navigationItem setRightBarButtonItem:self.takePicture];
	
	self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 400)];
	[self.view addSubview:self.imageView];
	
	//
	self.weiboButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 370, 100, 50)];
	[self.weiboButton setBackgroundColor:[UIColor redColor]];
	[self.weiboButton setTitle:@"weibo分享" forState:UIControlStateNormal];
	[self.view addSubview:self.weiboButton];
	[self.weiboButton addTarget:self action:@selector(sendWeibo) forControlEvents:UIControlEventTouchUpInside];
	self.factTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 410, 30, 200)];
	
	[self.view addSubview:self.factTextLabel];
	self.factTextLabel.text = @"我在这里";
	
	
}

- (void)sendWeibo
{
	FunActivity *funActivity = [[FunActivity alloc] init];
	
	NSString *string = [NSString stringWithString:self.factTextLabel.text];
	
	if (self.imageView.image == nil) {
		self.imageView.image = [UIImage imageNamed:@"3.jpg"];
	}
	
	UIActivityViewController *activityViewController = [[UIActivityViewController alloc]
														initWithActivityItems:@[self.imageView.image,string] applicationActivities:@[funActivity]];
	
	[self presentViewController:activityViewController animated:YES completion:nil];
}
- (void)getPic
{
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
	//如果设备支持相机，就是用拍摄模式
	//否则让用户从相片库中选择图片
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		[imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
	} else {
		[imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
	}
	
	[imagePicker setDelegate:self];
	
	[self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
	[self.imageView setImage: image];
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
