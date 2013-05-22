//
//  UIFilterView.h
//  UIFilterViewDemo
//
//  Created by jacob on 13-5-22.
//  Copyright (c) 2013年 jacob. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIFilterView;
@class UIFilterViewCell;

@protocol UIFilterViewDataSource <NSObject>

@required

- (NSInteger)numberOfSectionsInFilterView:(UIFilterView *)filterView;  //总行数
- (NSInteger)numberOfRowsInSection:(NSInteger)section ; // 每一行有几列

- (NSString *)filterView:(UIFilterView *)filterView titleForSection:(NSInteger)section; //每一行的标题  诸如：按类型、按地区、按年代等等

- (UIFilterViewCell *)filterView:(UIFilterView *)filterView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol UIFilterViewDelegate <NSObject>

@required
- (CGFloat)heightForRowAtSection:(NSInteger)section;  //不同的行，高度不同；同一行则无需区分
- (CGFloat)lengthForRowAtSection:(NSInteger)section;  //同一行，不同的列可能长度不等，譬如字太长，一般的话，直接弄个覆盖全面的长度足矣

- (void)filterView:(UIFilterView *)filterView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface UIFilterView : UIView <UIScrollViewDelegate>
{
    id<UIFilterViewDelegate> _delegate;
    id<UIFilterViewDataSource> _datasource;
    NSMutableArray *            _currentSelectedIndexArray;
    NSMutableArray *            _scrollViewArray;
    NSInteger                   _numberOfSections;
    BOOL                        _supportSectionTitle;//支持每一行的标题功能
    UIView                     *_backgroundView;
    

}

@property (nonatomic,assign)id<UIFilterViewDelegate> delegate;
@property (nonatomic,assign) id<UIFilterViewDataSource> datasource;


- (void)reloadData;

@end
