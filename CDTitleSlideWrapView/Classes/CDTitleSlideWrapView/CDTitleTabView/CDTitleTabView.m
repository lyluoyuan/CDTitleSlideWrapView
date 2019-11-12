//
//  CDTitleTabView.m
//  buildingChengDu
//
//  Created by mac on 2015/9/16.
//  Copyright © 2015年 datalk. All rights reserved.
//

#import "CDTitleTabView.h"

@interface CDTitleTabView()
@property(nonatomic,strong)UIView *indicatorLine;
@property(nonatomic,assign)BOOL isFirstLayout;
@end
@implementation CDTitleTabView

- (instancetype)init
    {
        self = [super init];
        if (self) {
            self.titleTabCollectionView = [CDTitleTabCollectionView new];
            [self addSubview:self.titleTabCollectionView];
            
//            [self.titleTabCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.edges.equalTo(self);
//            }];
            
            self.indicatorLine = [UIView new];
            [self addSubview:self.indicatorLine];
            self.indicatorLine.backgroundColor = [UIColor blueColor];
            
            __weak typeof(self) weakSelf = self;
            self.titleTabCollectionView.didSelect = ^(NSInteger selectIndex) {
                weakSelf.selectIndex = selectIndex;
                [weakSelf updateIndicatorFrame];
                if (weakSelf.didSelect) {
                    weakSelf.didSelect(selectIndex);
                }
            };
            self.titleTabCollectionView.didScroll = ^{
                [weakSelf updateIndicatorWithSelectIndexProgress:weakSelf.selectIndex];
            };
        }
        return self;
    }

-(void)layoutSubviews{
    self.titleTabCollectionView.frame = self.bounds;
    if (!self.isFirstLayout) {
        [self updateIndicatorFrame];
        self.isFirstLayout = YES;
    }
}
-(void)setItems:(NSArray *)items{
    _items = items;
    self.titleTabCollectionView.items = items;
    self.selectIndex = 0;
}
-(void)setSelectIndex:(NSInteger)selectIndex{
    _selectIndex = selectIndex;
//    [self updateIndicatorFrame];
    self.titleTabCollectionView.selectIndex = selectIndex;
    [self.titleTabCollectionView reloadData];
    [self.titleTabCollectionView scrollToSelectIndexIfNeeded];
}

-(void)updateIndicatorFrame{
    CGRect cellFrame = [self currentCellFrame];
    self.indicatorLine.frame = CGRectMake(cellFrame.origin.x, self.bounds.size.height-2, cellFrame.size.width, 2);
//    self.indicatorLine.frame = CGRectMake(self.selectIndex*self.bounds.size.width/MAX(1, self.items.count), self.bounds.size.height-2, self.bounds.size.width/MAX(1, self.items.count), 2);
}
-(CGRect)currentCellFrame{
    return [self cellFrameWithIndexPath:[NSIndexPath indexPathForItem:self.selectIndex inSection:0]];
}
-(CGRect)cellFrameWithIndexPath:(NSIndexPath *)indexPath{
    if (self.items.count == 0) {
        return CGRectZero;
    }
    UICollectionViewCell *cell = [self.titleTabCollectionView collectionView:self.titleTabCollectionView cellForItemAtIndexPath:indexPath];
    CGRect cellFrame = cell.frame;
    return cellFrame;
}
-(void)updateIndicatorWithSelectIndexProgress:(CGFloat)selectIndexProgress{

//    NSInteger toBeIndex = (NSInteger)MIN(ceil(selectIndexProgress), self.items.count-1);
//    CGRect cellFrame = [self cellFrameWithIndexPath:[NSIndexPath indexPathForItem:toBeIndex inSection:0]];
//    self.indicatorLine.frame = CGRectMake(selectIndexProgress/MAX(1, toBeIndex)*cellFrame.origin.x, self.bounds.size.height-2, cellFrame.size.width, 2);

    
    NSInteger lastIndex = (NSInteger)MAX(0,floor(selectIndexProgress));
    CGRect lastCellFrame = [self cellFrameWithIndexPath:[NSIndexPath indexPathForItem:lastIndex inSection:0]];

    NSInteger toBeIndex = (NSInteger)MIN(ceil(selectIndexProgress), self.items.count-1);
    CGRect cellFrame = [self cellFrameWithIndexPath:[NSIndexPath indexPathForItem:toBeIndex inSection:0]];
    CGFloat scale = toBeIndex == 0 ? 0 : selectIndexProgress/toBeIndex;
    
    CGFloat k = toBeIndex-lastIndex == 0 ? 0 :(cellFrame.size.width-lastCellFrame.size.width)/(toBeIndex-lastIndex);
    CGFloat b = lastCellFrame.size.width-k*lastIndex;
    CGFloat currentIndexWidth = k*selectIndexProgress+b;
    self.indicatorLine.frame = CGRectMake(scale*cellFrame.origin.x-self.titleTabCollectionView.contentOffset.x, self.bounds.size.height-2, currentIndexWidth, 2);

//    CGFloat widthScale = currentIndexWidth/lastCellFrame.size.width;
//    self.indicatorLine.transform = CGAffineTransformScale(CGAffineTransformIdentity, widthScale, 1);
}

-(void)reloadData{
    [self updateIndicatorWithSelectIndexProgress:self.selectIndex];
    [self.titleTabCollectionView reloadData];
}
@end
