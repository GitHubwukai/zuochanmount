//
//  DetailViewController.m
//  MeditationValley
//
//  Created by wukai on 13-8-21.
//  Copyright (c) 2013年 wukai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)myInit;

@end

@implementation DetailViewController
@synthesize detailText;
@synthesize detailImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
		[self myInit];
		
    }
    return self;
}


- (void)myInit
{
	[self.view setBackgroundColor:[UIColor grayColor]];
	
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	//[self.view setBackgroundColor:[UIColor colorWithRed:0.7 green:0.4 blue:0.1 alpha:1]];
	self.detailImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
	self.detailImage.image = [UIImage imageNamed:@"1.jpg"];
	
	self.detailText = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
	self.detailText.editable = NO;
	
	NSMutableParagraphStyle* paragraph = [[NSMutableParagraphStyle alloc] init];
	paragraph.alignment = NSTextAlignmentJustified;
	paragraph.firstLineHeadIndent = 20.0;
	paragraph.paragraphSpacingBefore = 16.0;
	paragraph.lineSpacing = 4;
	paragraph.hyphenationFactor = 1.0;
	
	NSShadow* myShadow = [[NSShadow alloc] init]; myShadow.shadowBlurRadius = 2.0; myShadow.shadowColor = [UIColor grayColor]; myShadow.shadowOffset = CGSizeMake(1,1);
	NSDictionary* attributes = @{
							  NSForegroundColorAttributeName:
			 [UIColor colorWithRed:0.2 green:0.239 blue:0.451 alpha:1] /*#333d73*/,
		 NSShadowAttributeName: myShadow,
		 NSParagraphStyleAttributeName: paragraph};
	
	NSString* txt = @"\n\n\n\n\n\n(UIFont*) Sets the font to render the text. If you want bold or italic text provide the correct name for each given font. These vary depending on the font family.\nFor example for the \"Helvetica Neue\" font you need to provide \"HelveticaNeue-Bold\" name for a bolded font, and \"HelveticaNeue-Italic\" for italic font.\nHowever, if you would like to use \"Courier New\", the font names are: \"CourierNewPS- ItalicMT\" for italic and \"CourierNewPS-BoldMT\" for bold.";
	NSAttributedString* aString = [[NSAttributedString alloc] initWithString: txt attributes: attributes];
	
	
	self.detailText.attributedText = aString;
	[self.detailText addSubview:self.detailImage];
	[self.view addSubview:self.detailText];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
