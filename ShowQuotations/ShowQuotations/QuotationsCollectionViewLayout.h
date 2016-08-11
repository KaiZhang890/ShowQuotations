//
//  QuotationsCollectionViewLayout.h
//  DDFindGoods
//
//  Created by zhangkai on 8/11/16.
//  Copyright © 2016 Kai Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuotationsCollectionViewLayout : UICollectionViewLayout

@property (strong, nonatomic) NSMutableArray *itemAttributes; // 表格数据量发生变化时，需清空这个数组

@end