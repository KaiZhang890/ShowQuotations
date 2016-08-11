//
//  MarketQuotationsViewController.m
//  DDFindGoods
//
//  Created by zhangkai on 8/11/16.
//  Copyright © 2016 Kai Zhang. All rights reserved.
//

#import "MarketQuotationsViewController.h"
#import "QuotationInfo.h"
#import "QuotationCell.h"
#import "QuotationsCollectionViewLayout.h"
#import "Macros.h"
#import <Masonry.h>

@interface MarketQuotationsViewController () <UICollectionViewDataSource> {
    UICollectionView *_collectionView;
    QuotationsCollectionViewLayout *_collectionViewLayout;
    NSMutableArray *_quotations;
}

@end

@implementation MarketQuotationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _quotations = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        QuotationInfo *qInfo = [[QuotationInfo alloc] init];
        qInfo.exchangeId = @"CR1612";
        qInfo.exchangeName = @"304R1612";
        qInfo.latestPrice = @"12800";
        qInfo.fluctuate = @"65";
        qInfo.fluctuateRatio = @"0.51";
        qInfo.volume = @"600";
        qInfo.open = @"12700";
        qInfo.high = @"12800";
        qInfo.low = @"12700";
        qInfo.orders = @"15302";
        qInfo.bid = @"12750";
        qInfo.bidAmount = @"20";
        qInfo.ask = @"12900";
        qInfo.askAmount = @"10";
        qInfo.average = @"12775";
        qInfo.lastSettlement = @"12735";
        [_quotations addObject:qInfo];
        
        qInfo = [[QuotationInfo alloc] init];
        qInfo.exchangeId = @"CR1608";
        qInfo.exchangeName = @"304R1608";
        qInfo.latestPrice = @"12000";
        qInfo.fluctuate = @"-30";
        qInfo.fluctuateRatio = @"-0.25";
        qInfo.volume = @"6";
        qInfo.open = @"12000";
        qInfo.high = @"12000";
        qInfo.low = @"12000";
        qInfo.orders = @"3208";
        qInfo.bid = @"0";
        qInfo.bidAmount = @"0";
        qInfo.ask = @"0";
        qInfo.askAmount = @"0";
        qInfo.average = @"12000";
        qInfo.lastSettlement = @"12030";
        [_quotations addObject:qInfo];
        
        qInfo = [[QuotationInfo alloc] init];
        qInfo.exchangeId = @"CR1607";
        qInfo.exchangeName = @"304R1607";
        qInfo.latestPrice = @"11805";
        qInfo.fluctuate = @"0.00";
        qInfo.fluctuateRatio = @"0.00";
        qInfo.volume = @"18";
        qInfo.open = @"--";
        qInfo.high = @"11805";
        qInfo.low = @"11805";
        qInfo.orders = @"12205";
        qInfo.bid = @"--";
        qInfo.bidAmount = @"--";
        qInfo.ask = @"--";
        qInfo.askAmount = @"--";
        qInfo.average = @"11805";
        qInfo.lastSettlement = @"11805";
        [_quotations addObject:qInfo];
    }
    
    _collectionViewLayout = [[QuotationsCollectionViewLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_collectionViewLayout];
    _collectionView.bounces = NO;
    _collectionView.directionalLockEnabled = YES;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = UIColorFromRGB(0x1d1d1d);
    [self.view addSubview:_collectionView];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    [_collectionView registerClass:[QuotationCell class] forCellWithReuseIdentifier:@"QuotationCell"];
}

#pragma mark - Private methods


#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _quotations.count + 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QuotationCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QuotationCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.backgroundColor = UIColorFromRGB(0x393939);
        cell.labelInfo.textColor = UIColorFromRGB(0x999999);
        cell.rightLine.hidden = NO;
        
        switch (indexPath.row) {
            case 0: {
                cell.labelInfo.text = @"商品";
            }
                break;
            case 1: {
                cell.labelInfo.text = @"最新";
            }
                break;
            case 2: {
                cell.labelInfo.text = @"涨跌";
            }
                break;
            case 3: {
                cell.labelInfo.text = @"涨跌幅%";
            }
                break;
            case 4: {
                cell.labelInfo.text = @"成交量";
            }
                break;
            case 5: {
                cell.labelInfo.text = @"开盘";
            }
                break;
            case 6: {
                cell.labelInfo.text = @"最高";
            }
                break;
            case 7: {
                cell.labelInfo.text = @"最低";
            }
                break;
            case 8: {
                cell.labelInfo.text = @"订货量";
            }
                break;
            case 9: {
                cell.labelInfo.text = @"买价";
            }
                break;
            case 10: {
                cell.labelInfo.text = @"买量";
            }
                break;
            case 11: {
                cell.labelInfo.text = @"卖价";
            }
                break;
            case 12: {
                cell.labelInfo.text = @"卖量";
            }
                break;
            case 13: {
                cell.labelInfo.text = @"均价";
            }
                break;
            case 14: {
                cell.labelInfo.text = @"昨结算";
            }
                break;
            default:
                break;
        }
    } else {
        cell.backgroundColor = UIColorFromRGB(0x282a2b);
        cell.rightLine.hidden = YES;
        
        QuotationInfo *qInfo = [_quotations objectAtIndex:indexPath.section - 1];
        UIColor *whiteColor = UIColorFromRGB(0xc0c0c0);
        UIColor *yellowColor = UIColorFromRGB(0xfefe3b);
        UIColor *redColor = UIColorFromRGB(0xdd4948);
        UIColor *greenColor = UIColorFromRGB(0x94cf59);
        switch (indexPath.row) {
            case 0: {
                cell.labelInfo.textColor = whiteColor;
                
                cell.labelInfo.numberOfLines = 0;
                NSDictionary *attrs1 = @{NSFontAttributeName: [UIFont systemFontOfSize:15]};
                NSDictionary *attrs2 = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
                NSMutableAttributedString *mAttStr = [[NSMutableAttributedString alloc] init];
                NSAttributedString *attStr = [[NSAttributedString alloc] initWithString:qInfo.exchangeId attributes:attrs1];
                [mAttStr appendAttributedString:attStr];
                attStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", qInfo.exchangeName] attributes:attrs2];
                [mAttStr appendAttributedString:attStr];
                cell.labelInfo.attributedText = mAttStr;
            }
                break;
            case 1: {
                cell.labelInfo.text = qInfo.latestPrice;
                if ([qInfo.latestPrice isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.latestPrice.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
                
            }
                break;
            case 2: {
                cell.labelInfo.text = qInfo.fluctuate;
                if ([qInfo.latestPrice isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.latestPrice.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 3: {
                cell.labelInfo.text = qInfo.fluctuateRatio;
                if ([qInfo.latestPrice isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.latestPrice.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 4: {
                cell.labelInfo.text = qInfo.volume;
                cell.labelInfo.textColor = yellowColor;
            }
                break;
            case 5: {
                cell.labelInfo.text = qInfo.open;
                if ([qInfo.open isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.open.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 6: {
                cell.labelInfo.text = qInfo.high;
                if ([qInfo.high isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.high.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 7: {
                cell.labelInfo.text = qInfo.low;
                if ([qInfo.low isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.low.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 8: {
                cell.labelInfo.text = qInfo.orders;
                cell.labelInfo.textColor = yellowColor;
            }
                break;
            case 9: {
                cell.labelInfo.text = qInfo.bid;
                if ([qInfo.bid isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.bid.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 10: {
                cell.labelInfo.text = qInfo.bidAmount;
                cell.labelInfo.textColor = yellowColor;
            }
                break;
            case 11: {
                cell.labelInfo.text = qInfo.ask;
                if ([qInfo.ask isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.ask.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 12: {
                cell.labelInfo.text = qInfo.askAmount;
                cell.labelInfo.textColor = yellowColor;
            }
                break;
            case 13: {
                cell.labelInfo.text = qInfo.average;
                if ([qInfo.average isEqualToString:qInfo.lastSettlement]) {
                    cell.labelInfo.textColor = whiteColor;
                } else if (qInfo.average.floatValue > qInfo.lastSettlement.floatValue) {
                    cell.labelInfo.textColor = redColor;
                } else {
                    cell.labelInfo.textColor = greenColor;
                }
            }
                break;
            case 14: {
                cell.labelInfo.text = qInfo.lastSettlement;
                cell.labelInfo.textColor = whiteColor;
            }
                break;
            default:
                break;
        }
    }
    return cell;
}

@end
