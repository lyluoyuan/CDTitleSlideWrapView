//
//  CDTitleTabCollectionView.h
//  buildingChengDu
//
//  Created by mac on 2015/9/16.
//  Copyright © 2015年 datalk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDTitleTabCollectionViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@class CDTitleTabCollectionView;
typedef CGSize(^CDTitleTabSizeBlock)(CDTitleTabCollectionView *titleTabCollectionView, NSIndexPath *indexPath, id title);
typedef void(^CDTitleTabCellBlock)(CDTitleTabCollectionViewCell *cell);
@interface CDTitleTabCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,strong)void(^didSelect)(NSInteger selectIndex);

@property(nonatomic,strong)CDTitleTabSizeBlock itemSizeBlock;
@property(nonatomic,strong)CDTitleTabCellBlock cellBlock;
@property(nonatomic,strong)UIColor *activeColor;
@property(nonatomic,strong)UIColor *inActiveColor;
@property(nonatomic,strong)void(^didScroll)(void);

-(void)scrollToSelectIndexIfNeeded;
@end

NS_ASSUME_NONNULL_END
