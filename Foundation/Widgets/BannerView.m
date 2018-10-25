//
//  BannerView.m
//  wisdom
//
//  Created by hhr on 2018/5/31.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import "BannerView.h"
#import "SmartImageView.h"

@implementation BannerView {
    NSInteger currentPage;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSLog(@"xxxxx");
    [self initBanner:_banners];
}

-(void)initBanner:(NSArray *)banners {
    _banners = banners;
    if (self.scrollView == nil) {
        self.scrollView = [[UIScrollView alloc]init];
        self.scrollView.frame = self.bounds;
        [self addSubview:self.scrollView];
    }
    
    [self.scrollView removeAllSubViews];
    
    float width = self.width;
    float height = self.height;
    NSInteger count = banners.count;
    for (int i = 0; i < count; i++) {
        SmartImageView *imageView = [[SmartImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        [imageView setImageUrl:banners[i]];
        
        UIButton *imageButton = [[UIButton alloc] initWithFrame:imageView.frame];
        [imageButton addTarget:self action:@selector(onBannerClickListener:) forControlEvents:UIControlEventTouchDown];
        imageButton.tag = i;
        
        [self.scrollView addSubview:imageView];
        [self.scrollView addSubview:imageButton];
    }
    
    self.scrollView.pagingEnabled = true;
    self.scrollView.contentSize = CGSizeMake(count * width, 0);
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

-(void)timerAction {
    int offset = 0;
    if (currentPage + 1 < self.scrollView.subviews.count) {
        currentPage++;
        offset = self.scrollView.width;
    } else {
        currentPage = 0;
        offset = -((self.scrollView.subviews.count - 1) * self.scrollView.width);
    }
    [UIView animateWithDuration:1 animations:^{
        [self.scrollView setContentOffset:CGPointMake(offset, 0)];
    } completion:^(BOOL finished) {
      
    }];
}

#pragma mark banner点击事件
- (void)onBannerClickListener:(UIButton *)sender {
    if (self.delegate != nil) {
        [self.delegate onBannerClick:self.scrollView position:sender.tag];
    }
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    currentPage = scrollView.contentOffset.x / scrollView.width;
    if (self.delegate != nil) {
        [self.delegate onBannerSelected:scrollView position:currentPage];
    }
}

@end
