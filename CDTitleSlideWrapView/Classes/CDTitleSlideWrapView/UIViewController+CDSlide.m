//
//  UIViewController+CDSlide.m
//  CDTitleSlideWrapView_Example
//
//  Created by mac on 2019/12/9.
//  Copyright © 2019年 lyluoyuan@126.com. All rights reserved.
//

#import "UIViewController+CDSlide.h"
#import <objc/runtime.h>
@implementation UIViewController (CDSlide)
-(void)setCd_slideViewController:(UIViewController *)vc{
    objc_setAssociatedObject(self, "cd_slideViewController", vc, OBJC_ASSOCIATION_RETAIN);
}
@end
