//
//  HotScenicCell.h
//  MeditationValley
//
//  Created by wukai on 13-8-22.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HotData;

@interface HotScenicCell : UITableViewCell
{
	UILabel *nameOneLabel;
	UIImageView *smallImage;
	UILabel *nameTwoLabel;
	UIImageView *largeImage;
	UILabel *explainLabel;
}

- (void)setData:(HotData*)data;
@end
