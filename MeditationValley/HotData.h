//
//  HotData.h
//  MeditationValley
//
//  Created by wukai on 13-8-22.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotData : NSObject
@property (nonatomic, strong) NSString *nameOneText;
@property (nonatomic, strong) NSString *nameTwoText;
@property (nonatomic, strong) NSString *largeImageName;
@property (nonatomic, strong) NSString *explainText;

- (HotData *)initWithArray:(NSArray *)array;

@end
