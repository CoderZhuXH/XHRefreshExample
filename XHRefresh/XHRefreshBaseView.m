//
//  XHRefreshBaseView.m
//  XHRefreshExample
//
//  Created by zhuxiaohui on 2016/10/27.
//  Copyright © 2016年 ruiec.cn. All rights reserved.
//

#import "XHRefreshBaseView.h"


@interface XHRefreshBaseView()

@property(nonatomic,strong)UIScrollView *scrollView;//记录scrollview
@property(nonatomic,assign)UIEdgeInsets scrollViewOriginalInset;//记录scrollView开始位置
@property (strong, nonatomic) UIPanGestureRecognizer *scrollViewPan;//记录scrollView手势

@end

@implementation XHRefreshBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
        self.refreshState = XHRefreshStateNone;
        
    }
    return self;
}
-(void)layoutSubviews
{
    [self setupSubviews];
    [super layoutSubviews];
}

/**
 *  设置UI
 */
-(void)setupUI
{
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.backgroundColor = [UIColor clearColor];
}
/**
 *  设置子视图
 */
-(void)setupSubviews{
}

-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    if(newSuperview ==nil) return;
    if(![newSuperview isKindOfClass:[UIScrollView class]]) return;
    
    self.xh_w = newSuperview.xh_w;//等宽
    self.xh_x = 0;
    
    _scrollView = (UIScrollView *)newSuperview;
    _scrollView.alwaysBounceVertical = YES;
    //记录原始位置
    _scrollViewOriginalInset = _scrollView.contentInset;
    //添加监听
    [self addObservers];
 
}

-(void)addObservers{
    
    //移除旧的
    [self.superview removeObserver:self forKeyPath:XHRefreshKeyPathContentOffset];
    [self.superview removeObserver:self forKeyPath:XHRefreshKeyPathContentSize];;
    [self.scrollViewPan removeObserver:self forKeyPath:XHRefreshKeyPathPanState];
    self.scrollViewPan = nil;
    
    //添加新的
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:XHRefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:XHRefreshKeyPathContentSize options:options context:nil];
    self.scrollViewPan = self.scrollView.panGestureRecognizer;
    [self.scrollViewPan addObserver:self forKeyPath:XHRefreshKeyPathPanState options:options context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if(!self.userInteractionEnabled) return;
    //就算影藏了,也需要处理
    if([keyPath isEqualToString:XHRefreshKeyPathContentSize]){
        
        [self scrollViewContentSizeDidChange:change];
    };
    if(self.hidden) return;
    if ([keyPath isEqualToString:XHRefreshKeyPathContentOffset]) {
        [self scrollViewContentOffsetDidChange:change];
    } else if ([keyPath isEqualToString:XHRefreshKeyPathPanState]) {
        [self scrollViewPanStateDidChange:change];
    }
}
/**
 *  交给子类来实现
 */
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change{
}
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{
}
- (void)scrollViewPanStateDidChange:(NSDictionary *)change{
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
