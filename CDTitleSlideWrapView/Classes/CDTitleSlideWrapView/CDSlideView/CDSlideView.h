//
//  CDSlideView.h
//  buildingChengDu
//
//  Created by mac on 2019/9/16.
//  Copyright © 2019年 datalk. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDSlideView : UIView
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *viewControllers;
@property (nonatomic, assign) NSInteger selectIndex;
@property(nonatomic,strong)void(^didScroll)(NSInteger index,CGFloat progressIndex);

    
-(void)updateOffsetWithIndex;

@property(nonatomic,strong)void(^indexChangeBlock)(NSInteger newIndex);
@end

NS_ASSUME_NONNULL_END
