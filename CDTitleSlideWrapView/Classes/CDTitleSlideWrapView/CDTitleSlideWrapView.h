//
//  CDTitleSlideWrapView.h
//  buildingChengDu
//
//  Created by mac on 2019/9/16.
//  Copyright © 2019年 datalk. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CDSlideView.h"
#import "CDTitleTabView.h"
NS_ASSUME_NONNULL_BEGIN

@interface CDTitleSlideWrapView : UIView
@property(nonatomic,strong)CDTitleTabView *titleTabView;
@property(nonatomic,strong)CDSlideView *slideView;
@property(nonatomic,assign,readonly)NSInteger currentIndex;
@property(nonatomic,strong)NSArray *items;
@property (nonatomic, strong) NSArray *viewControllers;
@property(nonatomic,strong)void(^willAppearBlock)(NSInteger index,CDTitleSlideWrapView *titleSlideWrapView);
-(void)reloadData;
@end

NS_ASSUME_NONNULL_END
