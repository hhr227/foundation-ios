//
//  BannerView.h
//  wisdom
//
//  Created by hhr on 2018/5/31.
//  Copyright © 2018年 hhr. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BannerViewDelegate<NSObject>

@optional
- (void)onBannerClick:(UIScrollView *)scrollView position:(NSInteger) position;
- (void)onBannerSelected:(UIScrollView *)scrollView position:(NSInteger) position;

@end

@interface BannerView : UIView <UIScrollViewDelegate>

@property(nonatomic) UIScrollView *scrollView;
@property(nonatomic, weak) id<BannerViewDelegate> delegate;
@property(nonatomic, copy) NSArray *banners;

-(void)initBanner:(NSArray *)banners;

@end
