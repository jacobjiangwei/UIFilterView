//
//  UIFilterViewCell.m
//  UIFilterViewDemo
//
//  Created by jacob on 13-5-22.
//  Copyright (c) 2013年 jacob. All rights reserved.
//

#import "UIFilterViewCell.h"

@implementation UIFilterViewCell

@synthesize selected=_selected;
@synthesize selectedColor=_selectedColor;
@synthesize backgroundColor=_backgroundColor;
@synthesize backgroundImageView=_backgroundImageView;
@synthesize index=_index;
@synthesize textLabel=_textLabel;
@synthesize selectedImageView=_selectedImageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

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

-(void)resetFrame:(CGRect)_frame
{
    [super setFrame:_frame];
    [_textLabel setFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height)];
}

-(id)initWithStatus:(BOOL)selected text:(NSString *)content selectedColor:(UIColor *)sColor normalColor:(UIColor *)nColor backgroundColor:(UIColor *)bColor indexPath:(NSIndexPath *)indexPath backgroundImageView:(UIImageView *)bImageView selectedImageView:(UIImageView *)sImageView
{
    self = [super init];
    if (self) {
        _selected=selected;
        _selectedColor=sColor;
        _normalColor=nColor;
        _backgroundColor=bColor;
        
        _index=indexPath;
        _backgroundImageView=bImageView;
        _selectedImageView=sImageView;

        
        // Initialization code
        _textLabel=[[UILabel alloc]init];
        _textLabel.text=content;
        _textLabel.backgroundColor=_backgroundColor;
        if (selected) {
            if (_selectedImageView) {
                self.backgroundImageView=_selectedImageView;
            }
            else if (_backgroundImageView)
            {
                self.backgroundImageView=_backgroundImageView;
            }
            else
            {
                _textLabel.textColor=_selectedColor;
            }
        }
        else
        {
            if (_backgroundImageView)
            {
                self.backgroundImageView=_backgroundImageView;
            }
            else
            {
                _textLabel.textColor=_normalColor;
            }
        }
        [self addSubview:_textLabel];
        
        _singleRecognizer= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap)];
        _singleRecognizer.numberOfTapsRequired = 1; // 单击
        [self addGestureRecognizer:_singleRecognizer];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated                    // animate between regular and selected state
{
    if (selected!=_selected) {
        if (animated) {
            _textLabel.textColor=_selectedColor;
        }
        else
        {
            _textLabel.textColor=_normalColor;
        }
    }
}

-(void)handleSingleTap
{
    NSLog(@"tap");
    _selected=YES;
    [self setSelected:YES animated:YES];
}

@end
