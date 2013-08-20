//
//  PagePhotosView.h
//  PagePhotosDemo
//
//  Created by junmin liu on 10-8-23.
//  Copyright 2010 Openlab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PagePhotosDataSource.h"

@interface PagePhotosView : UIView<UIScrollViewDelegate> {
	UIScrollView *scrollView;
	UIPageControl *pageControl;
	
	id<PagePhotosDataSource> __weak dataSource;
	NSMutableArray *imageViews;
    int i;
	
	// To be used when scrolls originate from the UIPageControl
    BOOL pageControlUsed;
}

@property (nonatomic, weak) id<PagePhotosDataSource> dataSource;
@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic,assign)int i;

- (IBAction)changePage:(id)sender;

- (id)initWithFrame:(CGRect)frame withDataSource:(id<PagePhotosDataSource>)_dataSource;

@end
