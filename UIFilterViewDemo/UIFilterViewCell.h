//
//  UIFilterViewCell.h
//  UIFilterViewDemo
//
//  Created by jacob on 13-5-22.
//  Copyright (c) 2013年 jacob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFilterViewCell : UIView <UIGestureRecognizerDelegate>

{
    UITapGestureRecognizer *_singleRecognizer;
    NSIndexPath *_index;
    BOOL        _selected;
    UIColor     *_selectedColor;
    UIColor     *_normalColor;
    UIColor     *_backgroundColor;
    UIImageView *_backgroundImageView;
    UIImageView *_selectedImageView;
    UILabel     *_textLabel;
}

@property(nonatomic,retain)            NSIndexPath  *index;
@property(nonatomic,getter=isSelected) BOOL         selected;                   // set selected state (title, image, background). default is NO. animated is NO
@property(nonatomic,retain)            UIColor      *selectedColor;
@property(nonatomic,retain)            UIColor      *normalColor;
@property(nonatomic,retain)            UIColor      *backgroundColor;
@property(nonatomic,retain)            UIImageView  *backgroundImageView;
@property(nonatomic,retain)            UIImageView  *selectedImageView;
@property(nonatomic,retain)            UILabel      *textLabel;

-(id)initWithStatus:(BOOL)selected text:(NSString *)content selectedColor:(UIColor *)sColor normalColor:(UIColor *)nColor backgroundColor:(UIColor *)bColor indexPath:(NSIndexPath *)indexPath backgroundImageView:(UIImageView *)bImageView selectedImageView:(UIImageView *)sImageView;
-(void)resetFrame:(CGRect)_frame;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;                     // animate between regular and selected state



@end
