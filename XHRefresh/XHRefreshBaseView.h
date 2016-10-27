//
//  XHRefreshBaseView.h
//  XHRefreshExample
//
//  Created by zhuxiaohui on 2016/10/27.
//  Copyright © 2016年 ruiec.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+XHExtension.h"
#import "XHRefreshConst.h"

typedef NS_ENUM(NSInteger,XHRefreshState) {

    /**
     *  普通默认状态
     */
    XHRefreshStateNone = 1,
    /**
     *  松开立即刷新
     */
    XHRefreshStatePulling,
    /**
     *  正在刷新
     */
    XHRefreshStateRefreshing,
    /**
     *  即将进入刷新
     */
    XHRefreshStateWillRefresh,
    /**
     *  没有更多数据
     */
    XHRefreshStateNoMoreData

};

/**
 *  正在刷新回调
 */
typedef void (^XHRefreshStateRefreshingBlock)();


@interface XHRefreshBaseView : UIView

/**
 *  刷新状态
 */
@property(nonatomic,assign)XHRefreshState refreshState;

/**
 *  正在刷新的回调
 */
@property (copy, nonatomic) XHRefreshStateRefreshingBlock refreshingBlock;

#pragma mark-以下方法由子类实现
/**
 *  设置UI
 */
-(void)setupUI NS_REQUIRES_SUPER;

/**
 *  设置子视图
 */
-(void)setupSubviews NS_REQUIRES_SUPER;

/**
 *  当scrollView的contentOffSet发生改变时调用
 */
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;

/**
 *  当scrollView的ContentSize发生改变时调用
 */
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;

/**
 *  当scrollView的拖拽状态发生改变改变时调用
 */
- (void)scrollViewPanStateDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;

@end
