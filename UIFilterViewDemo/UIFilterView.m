//
//  UIFilterView.m
//  UIFilterViewDemo
//
//  Created by jacob on 13-5-22.
//  Copyright (c) 2013年 jacob. All rights reserved.
//

#import "UIFilterView.h"
#import "UIFilterViewCell.h"

@implementation UIFilterView

@synthesize delegate=_delegate;
@synthesize datasource=_datasource;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)reloadData
{
    if (_scrollViewArray) {
        for (UIScrollView *child in _scrollViewArray) {
            NSArray *viewsToRemove = [child subviews];
            for (UIView *v in viewsToRemove) {
                [v release];
                v=nil;
            }
            [child release];
            child=nil;
        }
        [_scrollViewArray removeAllObjects];
        [_scrollViewArray release];
        _scrollViewArray=nil;
    }
    
    if (_lineViewArray) {
        for (UIView *obj in _lineViewArray) {
            [obj release];
            obj=nil;
        }
        [_lineViewArray removeAllObjects];
        [_lineViewArray release];
        _lineViewArray=nil;
    }
    
    if (_currentSelectedIndexArray) {
        for (NSIndexPath *obj in _currentSelectedIndexArray) {
            [obj release];
        }
        [_currentSelectedIndexArray removeAllObjects];
        [_currentSelectedIndexArray release];
        _currentSelectedIndexArray=nil;
    }
    _currentSelectedIndexArray =[[NSMutableArray alloc]initWithCapacity:0];
    _scrollViewArray=[[NSMutableArray alloc]initWithCapacity:0];
    _lineViewArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    CGRect _frame=self.frame;
    
    _numberOfSections=[_datasource numberOfSectionsInFilterView:self];
    
    
    for (int section=0; section<_numberOfSections; section++) {
        NSInteger numberInThisSection=[_datasource numberOfRowsInSection:section];
        CGFloat height=[_delegate heightForRowAtSection:section];
        CGFloat length=[_delegate lengthForRowAtSection:section];
        
        UIScrollView *sectionScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, section*(height+1), _frame.size.width, height)];
        [sectionScrollView setContentSize:CGSizeMake(numberInThisSection*length, height)];
        sectionScrollView.pagingEnabled=YES;
        sectionScrollView.bounces=NO;
        sectionScrollView.delegate=self;
        sectionScrollView.showsHorizontalScrollIndicator=NO;
        
        for (int eachRow=0; eachRow < numberInThisSection; eachRow++) {
            UIFilterViewCell *cell=[_datasource filterView:self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:eachRow inSection:section]];
            [cell resetFrame:CGRectMake(eachRow*length, 0, length, height)];
            [sectionScrollView addSubview:cell];
        }
        [self addSubview:sectionScrollView];
        [_scrollViewArray addObject:sectionScrollView];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, height*(section+1)+section, self.bounds.size.width, 1)];
        lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView];
        [_lineViewArray addObject:lineView];
    }

}

@end
