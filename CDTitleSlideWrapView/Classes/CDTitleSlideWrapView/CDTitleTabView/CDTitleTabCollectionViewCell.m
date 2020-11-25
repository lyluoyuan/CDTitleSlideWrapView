//
//  CDTitleTabCollectionViewCell.m
//  buildingChengDu
//
//  Created by mac on 2015/9/16.
//  Copyright © 2015年 datalk. All rights reserved.
//

#import "CDTitleTabCollectionViewCell.h"
#import "Masonry.h"
@interface CDTitleTabCollectionViewCell()

@end
@implementation CDTitleTabCollectionViewCell
    
    
- (instancetype)initWithFrame:(CGRect)frame
    {
        self = [super initWithFrame:frame];
        if (self) {
            self.titleLabel = [UILabel new];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor darkGrayColor];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;

            [self.contentView addSubview:self.titleLabel];
            [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self.contentView);
                make.leading.equalTo(self.contentView).with.offset(5);
                make.trailing.equalTo(self.contentView).with.offset(-5);
            }];
            self.titleLabel.adjustsFontSizeToFitWidth = YES;
        }
        return self;
    }

-(void)setTitle:(id)title{
    _title = title;
    self.titleLabel.text = title;
    UIColor *activeColor = self.activeColor ? self.activeColor : [UIColor blueColor];
    UIColor *inActiveColor = self.inActiveColor ? self.inActiveColor : [UIColor darkGrayColor];
    self.titleLabel.textColor = self.isSelected ? activeColor : inActiveColor;
}


@end
