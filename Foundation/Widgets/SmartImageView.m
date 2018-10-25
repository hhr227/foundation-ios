//
//  SmartImageView.m
//  together
//
//  Created by hhr on 15/11/7.
//  Copyright (c) 2015年 厦门象形远教网络科技有限公司. All rights reserved.
//

#import "SmartImageView.h"
#import "UIImageView+WebCache.h"
#import "StringUtils.h"

@implementation SmartImageView

-(void)setImageUrl:(NSString *)url {
    [self setImageUrl:url placeholderImage:nil];
    [self setImageUrl:url contentMode:UIViewContentModeScaleAspectFill];
}

-(void)setImageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage {
    self.clipsToBounds = YES;
    [self sd_setImageWithURL:[NSURL URLWithString:[StringUtils isEmpty:url] ? @"" : url] placeholderImage:placeholderImage];
}

-(void)setImageUrl:(NSString *)url contentMode:(UIViewContentMode)mode {
    [self setImageUrl:url placeholderImage:nil contentMode:mode];
}

-(void)setImageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage contentMode:(UIViewContentMode)mode {
    self.clipsToBounds = YES;
    self.contentMode = mode;
    [self sd_setImageWithURL:[NSURL URLWithString:[StringUtils isEmpty:url] ? @"" : url] placeholderImage:placeholderImage];
}

@end
