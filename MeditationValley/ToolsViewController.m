//
//  ToolsViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "ToolsViewController.h"

@interface ToolsViewController ()
{
	UITextView *textView;
}
@end

@implementation ToolsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = @"小贴士";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	textView = [[UITextView alloc] initWithFrame:self.view.frame];
	[textView setBackgroundColor:[UIColor grayColor]];
	[self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
