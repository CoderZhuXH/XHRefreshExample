//
//  UIView+XHExtension.m
//  XHRefreshExample
//
//  Created by zhuxiaohui on 2016/10/27.
//  Copyright © 2016年 ruiec.cn. All rights reserved.
//

#import "UIView+XHExtension.h"

@implementation UIView (XHExtension)

- (void)setXh_x:(CGFloat)xh_x
{
    CGRect frame = self.frame;
    frame.origin.x = xh_x;
    self.frame = frame;
}

- (CGFloat)xh_x
{
    return self.frame.origin.x;
}

- (void)setXh_y:(CGFloat)xh_y
{
    CGRect frame = self.frame;
    frame.origin.y = xh_y;
    self.frame = frame;
}

- (CGFloat)xh_y
{
    return self.frame.origin.y;
}

- (void)setXh_w:(CGFloat)xh_w
{
    CGRect frame = self.frame;
    frame.size.width = xh_w;
    self.frame = frame;
}

- (CGFloat)xh_w
{
    return self.frame.size.width;
}

- (void)setXh_h:(CGFloat)xh_h
{
    CGRect frame = self.frame;
    frame.size.height = xh_h;
    self.frame = frame;
}

- (CGFloat)xh_h
{
    return self.frame.size.height;
}

- (void)setXh_size:(CGSize)xh_size
{
    CGRect frame = self.frame;
    frame.size = xh_size;
    self.frame = frame;
}

- (CGSize)xh_size
{
    return self.frame.size;
}

- (void)setXh_origin:(CGPoint)xh_origin
{
    CGRect frame = self.frame;
    frame.origin = xh_origin;
    self.frame = frame;
}

- (CGPoint)xh_origin
{
    return self.frame.origin;
}


@end
