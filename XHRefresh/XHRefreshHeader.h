//
//  XHRefreshHeader.h
//  XHRefreshExample
//
//  Created by zhuxiaohui on 2016/10/27.
//  Copyright © 2016年 ruiec.cn. All rights reserved.
//

#import "XHRefreshBaseView.h"

@interface XHRefreshHeader : XHRefreshBaseView

/**
 *  创建header
 */
+(instancetype)headerWithRefreshingBlock:(XHRefreshStateRefreshingBlock)refreshingBlock;



@end
