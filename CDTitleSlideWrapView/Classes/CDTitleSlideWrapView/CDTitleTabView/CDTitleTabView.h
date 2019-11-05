//
//  CDTitleTabView.h
//  buildingChengDu
//
//  Created by mac on 2015/9/16.
//  Copyright © 2015年 datalk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDTitleTabCollectionView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CDTitleTabView : UIView
@property(nonatomic,strong)UIColor *indicatorColor;


@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,strong)CDTitleTabCollectionView *titleTabCollectionView;
@property(nonatomic,strong)void(^didSelect)(NSInteger selectIndex);
@property(nonatomic,strong)NSArray *items;

-(void)updateIndicatorWithSelectIndexProgress:(CGFloat)selectIndexProgress;
-(void)reloadData;
@end

NS_ASSUME_NONNULL_END
