//
//  XXSegmentView.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/6/12.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "XXSegmentView.h"

@interface XXSegmentView ()<UIScrollViewDelegate>
@property (nonatomic, copy) NSArray<NSString *> *arr;
@property (nonatomic, strong) NSMutableArray<UIButton *> *arrBtn;
@property (nonatomic, assign) NSUInteger lastSelectedIndex;
@property (nonatomic, assign) NSUInteger numberOfDiv;//一个屏幕显示多少个标签
@property (nonatomic, assign) CGFloat widthOfLabel;//一个标签的宽度

@property (nonatomic, strong) UIView *bottomView;

@end

@implementation XXSegmentView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        self.numberOfDiv = 5;
        self.widthOfLabel = frame.size.width / self.numberOfDiv;
        self.lastSelectedIndex = 0;
        [self setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]];
        //[self setBounces:NO];
        [self setShowsHorizontalScrollIndicator:NO];
        
        self.delegate = self;
    }
    return self;
}

- (void)setTitles:(NSArray<NSString *> *) aArr{
    self.arr = aArr;

    for (UIButton *btnEle in self.arrBtn) {
        [btnEle removeTarget:self action:@selector(btnElementClick:)
            forControlEvents:UIControlEventTouchUpInside];
        [btnEle removeFromSuperview];
    }
    [self.arrBtn removeAllObjects];
    
   [self setContentSize:CGSizeMake(MAX(self.widthOfLabel * self.arr.count, self.frame.size.width),
                                   self.frame.size.height)];
    
    for (NSUInteger uloop = 0; uloop < self.arr.count; uloop++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.widthOfLabel * uloop, 0, self.widthOfLabel , self.frame.size.height)];
        [btn setTitle:self.arr[uloop] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnElementClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        [self.arrBtn addObject:btn];
    }
    
    [self setContentOffset:CGPointMake(0, 0)];
    
    [self bringSubviewToFront:self.bottomView];
    [self bottomViewSlideToIndex:0];
    
    [self setSelectedIndex:0];
}

//点击事件
- (void)btnElementClick:(UIButton *)btn{
    NSUInteger currentClickedIndex = [self.arrBtn indexOfObject:btn];
    if(currentClickedIndex == NSUIntegerMax)   return;
    
    if([self getCurrentOffsetNumber] > 0
       && currentClickedIndex <= [self getCurrentOffsetNumber])//点击了最左边的Index
    {
        [UIView animateWithDuration:0.3 animations:^{
            [self setContentOffset:CGPointMake(self.contentOffset.x - self.widthOfLabel, self.contentOffset.y)];
        }];

    }
    else if([self getCurrentOffsetNumber] + self.numberOfDiv < self.arr.count
            && currentClickedIndex + 1 >= [self getCurrentOffsetNumber] + self.numberOfDiv)//点击了最右边的Index
    {
        [UIView animateWithDuration:0.3 animations:^{
            [self setContentOffset:CGPointMake(self.contentOffset.x + self.widthOfLabel, self.contentOffset.y)];
        }];

    }
    
    [self setSelectedIndex:currentClickedIndex];
    [self bottomViewSlideToIndex:currentClickedIndex];
}

- (void)bottomViewSlideToIndex:(NSUInteger)index{
    //bottomView的滑动动画
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame = self.bottomView.frame;
        frame.origin.x = index * self.widthOfLabel;
        [self.bottomView setFrame:frame];
    }];
}

//获取目前偏移在哪个标签
- (NSUInteger)getCurrentOffsetNumber{
    NSUInteger idx = (NSUInteger)(self.contentOffset.x / self.widthOfLabel );
    return idx;
}

//跳转到目标tab的Index
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    if(!self.arr) return;
    
    //原先的恢复颜色默认色
    if(self.lastSelectedIndex < self.arrBtn.count){
        [self.arrBtn[self.lastSelectedIndex] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    //设置当前tab的选中色
    if(selectedIndex < self.arrBtn.count){
        [self.arrBtn[selectedIndex] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    }
    self.lastSelectedIndex = selectedIndex;
}

#pragma mark - UIScroll Delegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    int idx = (int)((scrollView.contentOffset.x + scrollView.frame.size.width / self.numberOfDiv / 2) / self.widthOfLabel );
    
    NSLog(@"%d",idx);
    
    CGFloat offsetXTarget = (scrollView.frame.size.width / self.numberOfDiv) * idx;
    [UIView animateWithDuration:0.3 animations:^{
        [scrollView setContentOffset:CGPointMake(offsetXTarget, scrollView.contentOffset.y)];
    }];
}

#pragma mark - lazy
- (NSMutableArray<UIButton *> *)arrBtn{
    if(!_arrBtn){
        _arrBtn = [[NSMutableArray<UIButton *> alloc]initWithCapacity:4];
    }
    return _arrBtn;
}

- (UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - 5, self.widthOfLabel, 5)];
        [_bottomView setBackgroundColor:[UIColor greenColor]];
        [self addSubview:_bottomView];
    }
    return _bottomView;
}

@end



