//
//  UIFilterViewCell.m
//  UIFilterViewDemo
//
//  Created by jacob QQ: 110773265 on 13-5-22.
//  Copyright (c) 2013年 jacob QQ: 110773265. All rights reserved.
//

#import "UIFilterViewCell.h"

@implementation UIFilterViewCell

@synthesize selected=_selected;
@synthesize selectedColor=_selectedColor;
@synthesize backgroundColor=_backgroundColor;
@synthesize backgroundImage=_backgroundImage;
@synthesize index=_index;
@synthesize textLabel=_textLabel;
@synthesize selectedImage=_selectedImage;

@synthesize delegate=_delegate;
@synthesize backgroundView=_backgroundView;

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

-(void)dealloc
{
    [_singleRecognizer release];
    [_selectedColor release];
    [_normalColor release];
    [_backgroundColor release];
    [_backgroundImage release];
    [_selectedImage release];
    [_textLabel release];

    [super dealloc];
}

-(void)resetFrame:(CGRect)_frame
{
    [super setFrame:_frame];
    
    [_textLabel setFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height)];
    [_backgroundView setFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height)];
}

-(id)initWithStatus:(BOOL)selected text:(NSString *)content selectedColor:(UIColor *)sColor normalColor:(UIColor *)nColor backgroundColor:(UIColor *)bColor indexPath:(NSIndexPath *)indexPath backgroundImage:(UIImage *)bImage selectedImage:(UIImage *)sImage;
{
    self = [super init];
    if (self) {
        _selected=selected;
        _selectedColor=sColor;
        _normalColor=nColor;
        _backgroundColor=bColor;
        
        _index=indexPath;
        [_index retain];
        _backgroundImage=bImage;
        _selectedImage=sImage;
        
        _backgroundView=[[UIImageView alloc]init];
        [self addSubview:_backgroundView];

        
        // Initialization code
        _textLabel=[[UILabel alloc]init];
        _textLabel.text=content;
        _textLabel.backgroundColor=_backgroundColor;
        _textLabel.textAlignment=NSTextAlignmentCenter;
        if (selected) {
            if (_selectedImage) {
                [self.backgroundView setImage:_selectedImage];
            }
            else if (_backgroundImage)
            {
                [self.backgroundView setImage:_backgroundImage];
            }
            else
            {
                _textLabel.textColor=_selectedColor;
            }
        }
        else
        {
            if (_backgroundImage)
            {
                [self.backgroundView setImage:_backgroundImage];
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
        if (selected) {
            if (_selectedImage) {
                [_backgroundView setImage:_selectedImage];
            }
            _textLabel.textColor=_selectedColor;
        }
        else
        {
            if (_backgroundView) {
                [_backgroundView setImage:_backgroundImage];
            }
            _textLabel.textColor=_normalColor;
        }
    }
    _selected=selected;
}

-(void)handleSingleTap
{
    NSLog(@"tap");
    [self setSelected:YES animated:YES];
    [_delegate taped:self];
    
}

@end
