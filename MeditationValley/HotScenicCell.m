//
//  HotScenicCell.m
//  MeditationValley
//
//  Created by wukai on 13-8-22.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "HotScenicCell.h"
#import "HotData.h"

@implementation HotScenicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		smallImage = [[UIImageView alloc] initWithFrame:CGRectZero];
		[[self contentView] addSubview:smallImage];
		
		nameOneLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[[self contentView] addSubview:nameOneLabel];
		
		nameTwoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[[self contentView] addSubview:nameTwoLabel];
		
		largeImage = [[UIImageView alloc] initWithFrame:CGRectZero];
		[[self contentView] addSubview:largeImage];
		
		explainLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[[self contentView] addSubview:explainLabel];
    }
    return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	CGRect smallImageFrame = CGRectMake(10, 12, 18, 18);
	[smallImage setFrame:smallImageFrame];
	smallImage.backgroundColor = [UIColor redColor];
	
	CGRect nameOneLabelFrame = CGRectMake(36, 12, self.frame.size.width, 18);
	[nameOneLabel setFrame:nameOneLabelFrame];
	[nameOneLabel setBackgroundColor:[UIColor whiteColor]];
	
	CGRect nameTwoLabelFrame = CGRectMake(36, 45, 100, 15);
	[nameTwoLabel setFrame:nameTwoLabelFrame];
	[nameTwoLabel setBackgroundColor:[UIColor yellowColor]];
	
	CGRect largeImageFrame = CGRectMake(36, 68, 274, 145);
	[largeImage setFrame:largeImageFrame];
	[largeImage setBackgroundColor:[UIColor darkGrayColor]];
	
	CGRect explainLabelFrame = CGRectMake(36, 221, 274, 45);
	[explainLabel setFrame:explainLabelFrame];
	[explainLabel setBackgroundColor:[UIColor orangeColor]];
}


//待添加

- (void)setData:(HotData*)data
{
	//1
	nameOneLabel.text = data.nameOneText;
	//2
	smallImage.image = [UIImage imageNamed:@"weather.png"];
	//3
	nameTwoLabel.text = data.nameTwoText;
	//4
	NSString *largeImagePath = [[NSBundle mainBundle] pathForResource:data.largeImageName ofType:@"JPG"];
	largeImage.image = [[UIImage alloc] initWithContentsOfFile:largeImagePath];
	//5
	explainLabel.text = data.explainText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
