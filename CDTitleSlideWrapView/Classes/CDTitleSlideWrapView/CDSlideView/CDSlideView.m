//
//  CDSlideView.m
//  buildingChengDu
//
//  Created by mac on 2019/9/16.
//  Copyright © 2019年 datalk. All rights reserved.
//

#import "CDSlideView.h"
@interface CDSlideView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@end
@implementation CDSlideView

- (instancetype)init
    {
        self = [super init];
        if (self) {
            self.scrollView = [UIScrollView new];
            self.scrollView.pagingEnabled = YES;
            self.scrollView.delegate = self;
            self.scrollView.showsHorizontalScrollIndicator = NO;
            [self addSubview:self.scrollView];
        }
        return self;
    }
-(void)layoutSubviews{
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width*self.viewControllers.count, self.scrollView.bounds.size.height);
    [self addVCViewIfNeeded];
}
-(void)setViewControllers:(NSArray<id > *)viewControllers{
    _viewControllers = viewControllers;
    _selectIndex = 0;
    for (UIView *subview in self.scrollView.subviews) {
        [subview removeFromSuperview];
    }
    self.scrollView.contentSize = CGSizeMake(self.bounds.size.width*viewControllers.count, self.scrollView.bounds.size.height);
    
    [self addVCViewIfNeeded];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger rawIndex = self.selectIndex;
    self.selectIndex = (NSUInteger)(round(scrollView.contentOffset.x/scrollView.bounds.size.width));
    if (rawIndex != self.selectIndex && self.indexChangeBlock) {
        self.indexChangeBlock(self.selectIndex);
    }
    
    CGFloat progress = scrollView.contentOffset.x/self.bounds.size.width;
    if (self.didScroll) {
        self.didScroll(self.selectIndex,progress);
    }
    
    [self addVCViewIfNeeded];
}
-(void)addVCViewIfNeeded{
    if (_selectIndex < self.viewControllers.count) {
        UIViewController *vc = self.viewControllers[_selectIndex];
        if (!vc.view.superview) {
            vc.view.frame = CGRectMake(_selectIndex*self.scrollView.bounds.size.width, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
            [self.scrollView addSubview:vc.view];
        }
    }
}
-(void)updateOffsetWithIndex{
    self.scrollView.contentOffset = CGPointMake(self.selectIndex*self.bounds.size.width, 0);
}
@end
