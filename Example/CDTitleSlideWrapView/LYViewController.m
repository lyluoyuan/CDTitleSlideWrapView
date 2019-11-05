//
//  LYViewController.m
//  CDTitleSlideWrapView
//
//  Created by lyluoyuan@126.com on 11/04/2019.
//  Copyright (c) 2019 lyluoyuan@126.com. All rights reserved.
//

#import "LYViewController.h"
#import "CDTitleSlideWrapView.h"
@interface LYViewController ()

@end

@implementation LYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    CDTitleSlideWrapView *slideWrapView = [CDTitleSlideWrapView new];
    slideWrapView.frame = self.view.bounds;
    [self.view addSubview:slideWrapView];
    
    NSArray *rawTitles = @[@"title1",@"title2",@"title3"];
    slideWrapView.items = rawTitles;

    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor whiteColor];
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor whiteColor];
    slideWrapView.viewControllers = @[vc1,vc2,vc3];
    
////    取消注释试试看
//    slideWrapView.titleTabView.indicatorColor = [UIColor orangeColor];
//    slideWrapView.titleTabView.titleTabCollectionView.inActiveColor = [UIColor grayColor];
//    slideWrapView.titleTabView.titleTabCollectionView.activeColor = [UIColor redColor];
	// Do any additional setup after loading the view, typically from a nib.
}



@end
