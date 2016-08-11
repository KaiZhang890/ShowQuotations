//
//  QuotationCell.m
//  DDFindGoods
//
//  Created by zhangkai on 8/11/16.
//  Copyright © 2016 Kai Zhang. All rights reserved.
//

#import "QuotationCell.h"
#import <Masonry.h>
#import "Macros.h"

@implementation QuotationCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _labelInfo = [[UILabel alloc] init];
    _labelInfo.font = [UIFont systemFontOfSize:15];
    _labelInfo.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_labelInfo];
    [_labelInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    _rightLine = [[UIView alloc] init];
    _rightLine.backgroundColor = UIColorFromRGB(0x1d1d1d);
    [self addSubview:_rightLine];
    [_rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(7);
        make.width.mas_equalTo(.5);
        make.right.mas_equalTo(-1);
        make.bottom.mas_equalTo(-7);
    }];
    
    _bottomLine = [[UIView alloc] init];
    _bottomLine.backgroundColor = UIColorFromRGB(0x1d1d1d);
    [self addSubview:_bottomLine];
    [_bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(.5);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

@end
