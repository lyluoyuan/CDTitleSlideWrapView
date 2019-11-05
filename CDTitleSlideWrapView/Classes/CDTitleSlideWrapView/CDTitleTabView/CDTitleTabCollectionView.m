//
//  CDTitleTabCollectionView.m
//  buildingChengDu
//
//  Created by mac on 2015/9/16.
//  Copyright © 2015年 datalk. All rights reserved.
//

#import "CDTitleTabCollectionView.h"


@interface CDTitleTabCollectionView()

@end
@implementation CDTitleTabCollectionView

- (instancetype)init
    {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsZero;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self = [super initWithFrame:CGRectZero collectionViewLayout:layout];
        if (self) {
            self.showsHorizontalScrollIndicator = NO;
            self.backgroundColor = [UIColor whiteColor];
            self.delegate = self;
            self.dataSource = self;
            [self registerClass:[CDTitleTabCollectionViewCell class] forCellWithReuseIdentifier:@"CDTitleTabCollectionViewCell"];
        }
        return self;
    }
//-(void)setCellClass:(Class)cellClass{
//    _cellClass = cellClass;
//    [self registerClass:cellClass forCellWithReuseIdentifier:@"CDTitleTabCollectionViewCell"];
//}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.items.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CDTitleTabCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CDTitleTabCollectionViewCell" forIndexPath:indexPath];
    cell.activeColor = self.activeColor;
    cell.inActiveColor = self.inActiveColor;
    cell.isSelected = indexPath.item == self.selectIndex;
    cell.title = self.items[indexPath.item];
//    if (self.cellBlock) {
//        self.cellBlock(cell);
//    }
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.selectIndex = indexPath.row;
    if (self.didSelect) {
        self.didSelect(indexPath.item);
    }
    [self reloadData];
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return self.itemSizeBlock ? self.itemSizeBlock(self, indexPath, self.items[indexPath.item]) : CGSizeMake(collectionView.bounds.size.width/MAX(self.items.count, 1), collectionView.bounds.size.height);
}

- (void)setActiveColor:(UIColor *)activeColor{
    _activeColor = activeColor;
    [self reloadData];
}
- (void)setInActiveColor:(UIColor *)inActiveColor{
    _inActiveColor = inActiveColor;
    [self reloadData];
}
@end
