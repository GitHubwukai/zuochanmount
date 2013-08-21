//
//  DetailViewController.h
//  MeditationValley
//
//  Created by wukai on 13-8-21.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic, strong) UIImageView *detailImage;
@property (nonatomic, strong) UITextView *detailText;

- (void)setData:(UIImage *)image andText:(NSString *)text;

@end
