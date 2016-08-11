//
//  QuotationInfo.h
//  ShowQuotations
//
//  Created by zhangkai on 8/11/16.
//  Copyright © 2016 Kai Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuotationInfo : NSObject

@property (nonatomic, copy) NSString *exchangeId;
@property (nonatomic, copy) NSString *exchangeName;
@property (nonatomic, copy) NSString *latestPrice;
@property (nonatomic, copy) NSString *fluctuate;
@property (nonatomic, copy) NSString *fluctuateRatio;
@property (nonatomic, copy) NSString *volume;
@property (nonatomic, copy) NSString *open;
@property (nonatomic, copy) NSString *high;
@property (nonatomic, copy) NSString *low;
@property (nonatomic, copy) NSString *orders;
@property (nonatomic, copy) NSString *bid;
@property (nonatomic, copy) NSString *bidAmount;
@property (nonatomic, copy) NSString *ask;
@property (nonatomic, copy) NSString *askAmount;
@property (nonatomic, copy) NSString *average;
@property (nonatomic, copy) NSString *lastSettlement;

@end
