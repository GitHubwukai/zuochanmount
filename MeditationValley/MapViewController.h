//
//  MapViewController.h
//  MeditationValley
//
//  Created by wukai on 13-8-19.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NAMapView.h"

@interface MapViewController : UIViewController
{
	IBOutlet NAMapView *mapView;
}
@property (nonatomic, strong) IBOutlet NAMapView *mapView;
@end
