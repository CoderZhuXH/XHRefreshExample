//
//  XHRefreshHeader.m
//  XHRefreshExample
//
//  Created by zhuxiaohui on 2016/10/27.
//  Copyright © 2016年 ruiec.cn. All rights reserved.
//

#import "XHRefreshHeader.h"

@implementation XHRefreshHeader

+(instancetype)headerWithRefreshingBlock:(XHRefreshStateRefreshingBlock)refreshingBlock
{
    XHRefreshHeader *header = [[self alloc] init];
    header.refreshingBlock = [refreshingBlock copy];
    return header;
}

-(void)setupUI
{
    [super setupUI];
     self.xh_h = XHRefreshHeaderHeight;
}

-(void)setupSubviews
{
    [super setupSubviews];
    //self高度变化后,重新定义其y值
     self.xh_y = -self.xh_h;
}

-(void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    //正在刷新
    if(self.refreshState == XHRefreshStateRefreshing)
    {
    
    
    }










}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
