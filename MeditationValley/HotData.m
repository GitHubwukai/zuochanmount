//
//  HotData.m
//  MeditationValley
//
//  Created by wukai on 13-8-22.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "HotData.h"

@implementation HotData

@synthesize nameOneText, nameTwoText, largeImageName, explainText;
- (HotData *)initWithArray:(NSArray *)array
{
	if ([self init]) {
		nameOneText = [array objectAtIndex:0];
		nameTwoText = [array objectAtIndex:1];
		largeImageName = [array objectAtIndex:2];
		explainText = [array objectAtIndex:3];
	}
return self;

}
@end
