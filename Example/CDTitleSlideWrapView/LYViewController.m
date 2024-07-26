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
    slideWrapView.titleTabView.indicatorColor = [UIColor redColor];
    [self.view addSubview:slideWrapView];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)slideWrapView.titleTabView.titleTabCollectionView.collectionViewLayout;
    flowLayout.minimumInteritemSpacing = 12;
    slideWrapView.titleTabView.titleTabCollectionView.itemSizeBlock = ^CGSize(CDTitleTabCollectionView * _Nonnull titleTabCollectionView, NSIndexPath * _Nonnull indexPath, id _Nonnull title) {
        CGFloat width = [title boundingRectWithSize:CGSizeMake(375, 18) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} context:nil].size.width;
        
        return CGSizeMake(width+16+11, titleTabCollectionView.bounds.size.height);
    };
    
    NSArray *rawTitles = @[@"title1",@"title2",@"title3",@"title4",@"title5",@"title6",@"title7"];
    slideWrapView.items = rawTitles;

//    UIViewController *vc1 = [UIViewController new];
//    vc1.view.backgroundColor = [UIColor whiteColor];
//    UIViewController *vc2 = [UIViewController new];
//    vc2.view.backgroundColor = [UIColor yellowColor];
//    UIViewController *vc3 = [UIViewController new];
//    vc3.view.backgroundColor = [UIColor blueColor];
//    UIViewController *vc4 = [UIViewController new];
//    vc4.view.backgroundColor = [UIColor orangeColor];
//    UIViewController *vc5 = [UIViewController new];
//    vc5.view.backgroundColor = [UIColor lightGrayColor];
//    UIViewController *vc6 = [UIViewController new];
//    vc6.view.backgroundColor = [UIColor cyanColor];
//    UIViewController *vc7 = [UIViewController new];
//    vc7.view.backgroundColor = [UIColor brownColor];
    
    UIView *vc1 = [UIView new];
    vc1.backgroundColor = [UIColor whiteColor];
    UIView *vc2 = [UIView new];
    vc2.backgroundColor = [UIColor yellowColor];
    UIView *vc3 = [UIView new];
    vc3.backgroundColor = [UIColor blueColor];
    UIView *vc4 = [UIView new];
    vc4.backgroundColor = [UIColor orangeColor];
    UIViewController *vc5 = [UIViewController new];
    vc5.view.backgroundColor = [UIColor lightGrayColor];
    UIViewController *vc6 = [UIViewController new];
    vc6.view.backgroundColor = [UIColor cyanColor];
    UIViewController *vc7 = [UIViewController new];
    vc7.view.backgroundColor = [UIColor brownColor];
    
//    slideWrapView.titleTabView.indicatorWidth = 20;
    slideWrapView.viewControllers = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7];
    slideWrapView.titleTabView.titleTabCollectionView.cellBlock = ^(CDTitleTabCollectionViewCell * _Nonnull cell) {
        cell.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    };
    
////    取消注释试试看
//    slideWrapView.titleTabView.indicatorColor = [UIColor orangeColor];
//    slideWrapView.titleTabView.titleTabCollectionView.inActiveColor = [UIColor grayColor];
//    slideWrapView.titleTabView.titleTabCollectionView.activeColor = [UIColor redColor];
	// Do any additional setup after loading the view, typically from a nib.
}



@end
