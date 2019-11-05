//
//  CDTitleSlideWrapView.m
//  buildingChengDu
//
//  Created by mac on 2019/9/16.
//  Copyright © 2019年 datalk. All rights reserved.
//

#import "CDTitleSlideWrapView.h"
#import "Masonry.h"
@interface CDTitleSlideWrapView()

@end
@implementation CDTitleSlideWrapView

- (instancetype)init
    {
        self = [super init];
        if (self) {
            self.titleTabView = [CDTitleTabView new];
            [self addSubview:self.titleTabView];
            [self.titleTabView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.top.trailing.equalTo(self);
                make.height.equalTo(@50);
            }];
            
            self.slideView = [CDSlideView new];
            [self addSubview:self.slideView];
            [self.slideView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.bottom.trailing.equalTo(self);
                make.top.equalTo(self.titleTabView.mas_bottom);
            }];
            
            __weak typeof(self) weakSelf = self;
            self.titleTabView.didSelect = ^(NSInteger selectIndex) {
                weakSelf.slideView.selectIndex = selectIndex;
                [UIView animateWithDuration:0.2 animations:^{
                    [weakSelf.slideView updateOffsetWithIndex];
                }];
                if (weakSelf.willAppearBlock) {
                    weakSelf.willAppearBlock(selectIndex,weakSelf);
                }
            };
            self.slideView.didScroll = ^(NSInteger index, CGFloat progressIndex) {
                weakSelf.titleTabView.selectIndex = index;
                [weakSelf.titleTabView updateIndicatorWithSelectIndexProgress:progressIndex];
            };
            self.slideView.indexChangeBlock = ^(NSInteger newIndex) {
                if (weakSelf.willAppearBlock) {
                    weakSelf.willAppearBlock(newIndex,weakSelf);
                }
            };
        }
        return self;
    }
-(void)setItems:(NSArray *)items{
    _items = items;
    self.titleTabView.items = items;
}
-(void)setViewControllers:(NSArray *)viewControllers{
    _viewControllers = viewControllers;
    self.slideView.viewControllers = viewControllers;
}
-(void)reloadData{
    [self.titleTabView reloadData];
}
-(NSInteger)currentIndex{
    return self.titleTabView.selectIndex;
}
@end
