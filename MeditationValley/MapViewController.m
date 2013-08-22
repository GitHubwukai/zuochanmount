//
//  MapViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		self.title = @"景区地图";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	UIImage *imageMap = [UIImage imageNamed:@"map.jpg"];
	
	[mapView displayMap:imageMap];
	mapView.backgroundColor = [UIColor colorWithRed:0.0f green:0.475f blue:0.761 alpha:1.0f];
	
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
