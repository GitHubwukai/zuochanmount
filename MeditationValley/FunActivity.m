//
//  FunActivity.m
//  MeditationValley
//
//  Created by wukai on 13-8-27.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "FunActivity.h"
#import <QuartzCore/QuartzCore.h>

@implementation FunActivity
- (UIImage *)activityImage
{
	return [UIImage imageNamed:@"1.jpg"];
}

- (NSString *)activityTitle
{
	return @"save quote to photos";
}

- (NSString *)activityType
{
	return @"wu.kai.FunFacts.qutoView";
}


- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
	for (int i = 0; i < activityItems.count; i++) {
		id item = activityItems[i];
		
		if ([item class] == [UIImage class] || [item isKindOfClass:[NSString class]]) {
			
		}else
		{
		return NO;
		}
	}
	return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
	for (int i = 0; i < activityItems.count; i++) {
		id item = activityItems[i];
		
		if ([item class] == [UIImage class]) {
			self.authorImage = item;
		}
		else if ([item isKindOfClass:[NSString class]])
			{
			self.funFaceText = item;
			}
	}
}

- (void)performActivity {
	CGSize quoteSize = CGSizeMake(640, 960); UIGraphicsBeginImageContext(quoteSize);
	UIView *quoteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, quoteSize.width, quoteSize.height)];
	quoteView.backgroundColor = [UIColor blackColor];
	UIImageView *imageView = [[UIImageView alloc] initWithImage:self.authorImage];
	imageView.frame = CGRectMake(20, 20, 600, 320);
	imageView.backgroundColor = [UIColor clearColor];
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	[quoteView addSubview:imageView];
	UILabel *factLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 360, 600, 600)];
	factLabel.backgroundColor = [UIColor clearColor];
	factLabel.numberOfLines = 10;
	factLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold"
									 size:44];
	factLabel.textColor = [UIColor whiteColor];
	factLabel.text = self.funFaceText;
	factLabel.textAlignment = NSTextAlignmentCenter;
	[quoteView addSubview:factLabel];
	[quoteView.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *imageToSave = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext(); UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil);
	[self activityDidFinish:YES];
}
@end
