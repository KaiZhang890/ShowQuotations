# ShowQuotations
行情视图Demo，基于UICollectionView实现表格上下、左右滚动，第一行、第一列保持固定。

# Screenshot
![alt text](https://raw.githubusercontent.com/KaiZhang890/ShowQuotations/master/Screenshot.gif)

# 说明
QuotationsCollectionViewLayout继承UICollectionViewLayout。  
每一行为一个section，横向每个单元格为一个cell。

``` objective-c
- (void)prepareLayout {
    if ([self.collectionView numberOfSections] == 0) {
        return;
    }
    
    NSUInteger column = 0;
    CGFloat xOffset = 0.0;
    CGFloat yOffset = 0.0;
    CGFloat contentWidth = 0.0;
    CGFloat contentHeight = 0.0;
    
    if (self.itemAttributes.count > 0) {
        for (int section = 0; section < [self.collectionView numberOfSections]; section++) {
            NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:section];
            for (NSUInteger index = 0; index < numberOfItems; index++) {
                if (section != 0 && index != 0) { // 不是第一行，也不是第一列
                    continue;
                }
                UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:section]];
                if (section == 0) { // 保持第一行的位置
                    CGRect frame = attributes.frame;
                    frame.origin.y = self.collectionView.contentOffset.y;
                    attributes.frame = frame;
                }
                if (index == 0) { // 保持第一列的位置
                    CGRect frame = attributes.frame;
                    frame.origin.x = self.collectionView.contentOffset.x;
                    attributes.frame = frame;
                }
            }
        }
        
        return;
    }
    
    self.itemAttributes = [@[] mutableCopy];
    NSUInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    
    for (int section = 0; section < [self.collectionView numberOfSections]; section++) {
        NSMutableArray *sectionAttributes = [@[] mutableCopy];
        for (NSUInteger index = 0; index < numberOfItems; index++) {
            
            // 所有单元格长度相同，也可以根据index设置不同
            NSString *testText = @"涨跌幅% \u2193";
            CGSize itemSize = [testText sizeWithAttributes: @{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
            if (section == 0) {
                // 第一行高：44
                itemSize = CGSizeMake(itemSize.width, 44);
            } else {
                // 其它行高：50
                itemSize = CGSizeMake(itemSize.width, 50);
            }
                        
            // 为每一个单元格设置布局属性
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:section];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height));
            
            if (section == 0 && index == 0) {
                attributes.zIndex = 1024; // 置于最前
            } else if (section == 0 || index == 0) {
                attributes.zIndex = 1023;
            }
            if (section == 0) {
                CGRect frame = attributes.frame;
                frame.origin.y = self.collectionView.contentOffset.y;
                attributes.frame = frame; // 第一行的位置
            }
            if (index == 0) {
                CGRect frame = attributes.frame;
                frame.origin.x = self.collectionView.contentOffset.x;
                attributes.frame = frame; // 第一列的位置
            }
            
            [sectionAttributes addObject:attributes];
            
            xOffset = xOffset+itemSize.width;
            column++;
            
            if (column == numberOfItems) {
                if (xOffset > contentWidth) {
                    contentWidth = xOffset;
                }
                
                column = 0;
                xOffset = 0;
                yOffset += itemSize.height;
            }
        }
        [self.itemAttributes addObject:sectionAttributes];
    }
    
    // 根据最后一个单元格布局计算整个CollectionView的Size
    UICollectionViewLayoutAttributes *attributes = [[self.itemAttributes lastObject] lastObject];
    contentHeight = attributes.frame.origin.y+attributes.frame.size.height;
    self.contentSize = CGSizeMake(contentWidth, contentHeight);
}
```

# License
[WTFPL](http://www.wtfpl.net) - do What The Fuck you want to Public License
