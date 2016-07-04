//
//  BannerViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/5/5.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "BannerViewController.h"

@interface BannerViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scroll;
@property (strong, nonatomic) UIPageControl *page;
@property (assign, nonatomic) int count;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.count = 3;//3个图片轮转
    [self addView];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (IBAction)clickTest:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"N1" object:nil];

//    [self timerAction];
}

- (void)addView{
    _scroll = [[UIScrollView alloc]init];
    [_scroll setBounces:NO];
    [_scroll setFrame:CGRectMake(3.0f, 100.0f, 300.0f, 100.0f)];
    [_scroll setBackgroundColor:[UIColor grayColor]];
    CGSize contentSize = CGSizeMake(_scroll.frame.size.width * (self.count + 2), _scroll.frame.size.height );
    [_scroll setContentSize:contentSize];
    [_scroll setShowsHorizontalScrollIndicator:NO];
    [_scroll setShowsVerticalScrollIndicator:NO];
    [_scroll setContentOffset:CGPointMake(_scroll.frame.size.width, 0)];
    _scroll.pagingEnabled = YES;
    _scroll.delegate = self;
    
    //添加图片,中间的几个
    for (int iloop = 1; iloop <= self.count; iloop++) {
        NSString *imageName = [NSString stringWithFormat:@"%d.png",(int)iloop];
        UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        [imgView setFrame:CGRectMake(_scroll.frame.size.width * iloop, 0, _scroll.frame.size.width, _scroll.frame.size.height)];
        [_scroll addSubview:imgView];
    }
    
    //两侧的
#if 1
    NSString *imageNameLeft = [NSString stringWithFormat:@"%d.png",(int)self.count];
    UIImageView *imgViewLeft = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageNameLeft]];
    [imgViewLeft setFrame:CGRectMake(0, 0, _scroll.frame.size.width, _scroll.frame.size.height)];
    [_scroll addSubview:imgViewLeft];
    
    NSString *imageNameRight = [NSString stringWithFormat:@"%d.png",1];
    UIImageView *imgViewRight = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageNameRight]];
    [imgViewRight setFrame:CGRectMake(_scroll.frame.size.width * (self.count + 1), 0, _scroll.frame.size.width, _scroll.frame.size.height)];
    [_scroll addSubview:imgViewRight];
#endif
    //标记
    _page = [[UIPageControl alloc]init];
    _page.frame = CGRectMake(self.scroll.frame.origin.x, self.scroll.frame.origin.y, 30, 10);
    _page.pageIndicatorTintColor = [UIColor redColor];
    _page.backgroundColor = [UIColor colorWithRed:0.0f green:0.7f blue:0.0f alpha:0.3];
    _page.currentPageIndicatorTintColor = [UIColor blueColor];
    _page.currentPage = 0;
    _page.userInteractionEnabled = NO;
    _page.numberOfPages = self.count;
    
    [self.view addSubview:_scroll];
    [self.view addSubview:_page];
    
    [self resetPageNumber];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self resetPageNumber];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if(scrollView.contentOffset.x <= 0.0f){//到了最左边一个图片
        [scrollView setContentOffset:CGPointMake(self.count * scrollView.frame.size.width, 0)];
    }
    else if(scrollView.contentOffset.x >= (self.count + 1) * scrollView.frame.size.width){//到了最右边的图片
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];
    }
    
    [self resetPageNumber];
}

- (void)resetPageNumber{//就近原则
    int idx = (int)((self.scroll.contentOffset.x + self.scroll.frame.size.width/2) / self.scroll.frame.size.width);
    int currentPage = (idx - 1) % self.count;
    if(currentPage != _page.currentPage){
        _page.currentPage = currentPage;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)timerAction{
    CGFloat offsetX = self.scroll.contentOffset.x;
    CGFloat offsetY = self.scroll.contentOffset.y;
    offsetX += self.scroll.frame.size.width;
    
    [UIView animateWithDuration:0.2 animations:^{
        [self.scroll setContentOffset:CGPointMake(offsetX, offsetY)];
    } completion:^(BOOL finished) {
        [self scrollViewDidEndDecelerating:self.scroll];
    }];
}



@end





