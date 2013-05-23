//
//  UIFilterView.h
//  UIFilterViewDemo
//
//  Created by jacob QQ: 110773265 on 13-5-22.
//  Copyright (c) 2013年 jacob QQ: 110773265. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFilterViewCell.h"
@class UIFilterView;
@class UIFilterViewCell;


@protocol UIFilterViewDataSource <NSObject>

@required

- (NSInteger)numberOfSectionsInFilterView:(UIFilterView *)filterView;  //总行数
- (NSInteger)numberOfRowsInSection:(NSInteger)section ; // 每一行有几列

- (NSString *)filterView:(UIFilterView *)filterView titleForSection:(NSInteger)section; //每一行的标题  诸如：按类型、按地区、按年代等等


/*
 这段代码该这么初始化返回过去，跟uitableviewcell一样，这里也支持自定义化，无需设定frame，会自动排版
UIFilterViewCell *cell=[[UIFilterViewCell alloc]initWithStatus:NO text:@"Testha" selectedColor:[UIColor redColor] normalColor:[UIColor blackColor] backgroundColor:[UIColor clearColor] indexPath:indexPath backgroundImage:_cellbackgroundImage selectedImage:_cellSelectedImage]; 
 */
- (UIFilterViewCell *)filterView:(UIFilterView *)filterView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol UIFilterViewDelegate <NSObject>

@required
- (CGFloat)heightForRowAtSection:(NSInteger)section;  //不同的行，高度不同；同一行则无需区分
- (CGFloat)lengthForRowAtSection:(NSInteger)section;  //同一行，不同的列可能长度不等，譬如字太长，一般的话，直接弄个覆盖全面的长度足矣

- (void)filterView:(UIFilterView *)filterView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;//大家都懂的吧

@optional
-(CGFloat)lengthForSectionHeader:(NSInteger)section;//如果有按类型、按地区这样的标题，标题的长度在这里设定


@end


@interface UIFilterView : UIView <UIScrollViewDelegate,UIFilterViewCellDelegate>
{
    id<UIFilterViewDelegate> _delegate;
    id<UIFilterViewDataSource> _datasource;
    NSMutableArray *            _currentSelectedIndexArray;
    NSMutableArray *            _scrollViewArray;
    NSMutableArray *            _lineViewArray;
    NSInteger                   _numberOfSections;
    BOOL                        _supportSectionTitle;//支持每一行的标题功能
    CGFloat                     _headerLength;      
    UIImage                     *_backgroundImage;  
    

}


@property (nonatomic,assign)    BOOL            supportSectionTitle;
@property (nonatomic,retain)    UIImage          *backgroundImage;  //初始化之前，如果想弄个整体背景图，在这里赋值，也可以不设
@property (nonatomic,assign)id<UIFilterViewDelegate> delegate;
@property (nonatomic,assign) id<UIFilterViewDataSource> datasource;


- (void)reloadData;//房事不爽，再来一次

@end
