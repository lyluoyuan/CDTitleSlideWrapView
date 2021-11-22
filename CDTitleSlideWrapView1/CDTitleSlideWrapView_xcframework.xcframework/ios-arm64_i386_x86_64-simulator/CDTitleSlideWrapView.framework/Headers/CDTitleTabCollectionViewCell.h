//
//  CDTitleTabCollectionViewCell.h
//  buildingChengDu
//
//  Created by mac on 2015/9/16.
//  Copyright © 2015年 datalk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDTitleTabCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,assign)BOOL isSelected;

@property(nonatomic,strong)id title;
@property(nonatomic,strong)UIColor *activeColor;
@property(nonatomic,strong)UIColor *inActiveColor;
@end

NS_ASSUME_NONNULL_END
