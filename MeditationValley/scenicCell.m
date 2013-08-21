//
//  scenicCell.m
//  MeditationValley
//
//  Created by wukai on 13-8-21.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "scenicCell.h"

@implementation scenicCell
@synthesize nameLabel;
@synthesize scenicImage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		[[self contentView] addSubview:nameLabel];
		
		scenicImage = [[UIImageView alloc] initWithFrame:CGRectZero];
		[[self contentView ] addSubview:scenicImage];
    }
    return self;
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	//CGRect bounds = [[self contentView] bounds];
	
	CGRect nameLabelFrame = CGRectMake(52, 0, 270, 40);
	[nameLabel setFrame:nameLabelFrame];
	
	CGRect imageFrame = CGRectMake(5, 5, 45, 45);
	[scenicImage setFrame:imageFrame];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
