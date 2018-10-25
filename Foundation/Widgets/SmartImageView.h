//
//  SmartImageView.h
//  together
//
//  Created by hhr on 15/11/7.
//  Copyright (c) 2015年 厦门象形远教网络科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmartImageView : UIImageView

-(void)setImageUrl:(NSString *)url;

-(void)setImageUrl:(NSString *)url contentMode:(UIViewContentMode)mode;

-(void)setImageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage;

-(void)setImageUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage contentMode:(UIViewContentMode)mode;

@end
