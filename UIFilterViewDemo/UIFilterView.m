//
//  UIFilterView.m
//  UIFilterViewDemo
//
//  Created by jacob QQ: 110773265 on 13-5-22.
//  Copyright (c) 2013年 jacob QQ: 110773265. All rights reserved.
//

#import "UIFilterView.h"
#import "UIFilterViewCell.h"

@implementation UIFilterView

@synthesize delegate=_delegate;
@synthesize datasource=_datasource;

@synthesize supportSectionTitle=_supportSectionTitle;
@synthesize backgroundImage=_backgroundImage;


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
    if (_backgroundImage) {
        UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:_frame];
        [backgroundImageView setImage:_backgroundImage];
        backgroundImageView.autoresizesSubviews=YES;
        [self addSubview:backgroundImageView];
    }

    
    _numberOfSections=[_datasource numberOfSectionsInFilterView:self];
    _headerLength=0.0f;
    
    for (int section=0; section<_numberOfSections; section++) {
        NSInteger numberInThisSection=[_datasource numberOfRowsInSection:section];
        CGFloat height=[_delegate heightForRowAtSection:section];
        CGFloat length=[_delegate lengthForRowAtSection:section];
        
        //支持标题
        if (_supportSectionTitle) {
            NSString *headerTitle=[_datasource filterView:self titleForSection:section];
            _headerLength=[_delegate lengthForSectionHeader:section];
            UILabel *headerLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, section*(height+1), _headerLength, height)];
            headerLabel.text=headerTitle;
            headerLabel.backgroundColor=[UIColor clearColor];
            headerLabel.textAlignment=NSTextAlignmentCenter;
            [self addSubview:headerLabel];
        }
        
        //滚动条筛选器，设定好
        UIScrollView *sectionScrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0+_headerLength, section*(height+1), _frame.size.width-_headerLength, height)];
        [sectionScrollView setContentSize:CGSizeMake(numberInThisSection*length, height)];
        sectionScrollView.pagingEnabled=YES;
        sectionScrollView.bounces=NO;
        sectionScrollView.delegate=self;
        sectionScrollView.showsHorizontalScrollIndicator=NO;
        //每列都是一个cell
        for (int eachRow=0; eachRow < numberInThisSection; eachRow++) {
            UIFilterViewCell *cell=[_datasource filterView:self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:eachRow inSection:section]];
            [cell resetFrame:CGRectMake(eachRow*length, 0.0f, length, height)];
            cell.delegate=self;
            [sectionScrollView addSubview:cell];
        }
        [self addSubview:sectionScrollView];
        [_scrollViewArray addObject:sectionScrollView];
        //存数组里，方便删除
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, height*(section+1)+section, self.bounds.size.width, 1)];
        lineView.backgroundColor = [UIColor grayColor];
        [self addSubview:lineView];
        [_lineViewArray addObject:lineView];
    }
}

#pragma mark UIFilterViewCellDelegate

-(void)taped:(UIFilterViewCell *)sender
{
    UIScrollView *scollView=[_scrollViewArray objectAtIndex:sender.index.section];
    NSArray *subViews=[scollView subviews];
    for (UIFilterViewCell *cell in subViews) {
        if (cell!=sender) {
            if ([cell respondsToSelector:@selector(setSelected:animated:)]) {
                [cell setSelected:NO animated:YES];
            }
        }
        else if (cell==sender)
        {
            [scollView scrollRectToVisible:cell.frame animated:YES];
        }
    }
    [_delegate filterView:self didSelectRowAtIndexPath:sender.index];
}

@end
