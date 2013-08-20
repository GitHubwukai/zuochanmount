//
//  GetWeather.m
//  MeditationValley
//
//  Created by wukai on 13-8-20.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "GetWeather.h"
#import "SBJson.h"

NSString *weatherAPI = @"http://www.weather.com.cn/data/cityinfo/101180701.html";

@implementation GetWeather
{
	NSString * outString;
	NSString *weather;
	NSString *topTp;
	NSString *lowTp;
	NSString *Tp;
}

- (id)init
{
    self = [super init];
    if (self) {
        [self myInit];
    }
    return self;
}

- (void)myInit
{
	NSURL *url = [NSURL URLWithString:weatherAPI];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
	NSURLConnection *connection = [[NSURLConnection alloc]
								   initWithRequest:request delegate:self];
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	outString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSMutableDictionary *jsonObj = [outString JSONValue];
	NSMutableDictionary *jsonSubObj = [jsonObj objectForKey:@"weatherinfo"];
	weather = [[NSString alloc] initWithFormat:@"%@\n", [jsonSubObj objectForKey:@"weather"]];
	topTp = [[NSString alloc]initWithFormat:@"%@\n", [jsonSubObj objectForKey:@"temp1"]];
	lowTp = [[NSString alloc]initWithFormat:@"%@\n",[jsonSubObj objectForKey:@"temp2"] ];
	
	self.weatherInfo = [[NSString alloc]initWithFormat:@"%@",weather];
	NSLog(@"%@", self.weatherInfo);
	
}

@end
