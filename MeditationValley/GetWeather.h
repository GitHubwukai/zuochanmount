//
//  GetWeather.h
//  MeditationValley
//
//  Created by wukai on 13-8-20.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetWeather : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSString *weatherInfo;
- (void)myInit;

@end
