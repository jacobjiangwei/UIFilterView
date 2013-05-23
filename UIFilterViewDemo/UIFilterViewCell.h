//
//  UIFilterViewCell.h
//  UIFilterViewDemo
//
//  Created by jacob QQ: 110773265 on 13-5-22.
//  Copyright (c) 2013年 jacob QQ: 110773265. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIFilterViewCell;

@protocol UIFilterViewCellDelegate <NSObject>

@optional

-(void)taped:(UIFilterViewCell *)sender;

@end

@interface UIFilterViewCell : UIView <UIGestureRecognizerDelegate>

{
    UITapGestureRecognizer *_singleRecognizer;
    NSIndexPath *_index;
    BOOL        _selected;
    UIColor     *_selectedColor;
    UIColor     *_normalColor;
    UIColor     *_backgroundColor;
    UIImage     *_backgroundImage;
    UIImage     *_selectedImage;
    UIImageView *_backgroundView;
    UILabel     *_textLabel;
    id<UIFilterViewCellDelegate> _delegate;
}

@property (nonatomic,assign) id<UIFilterViewCellDelegate> delegate;

@property(nonatomic,retain)            NSIndexPath  *index;
@property(nonatomic,getter=isSelected) BOOL         selected;                   // set selected state (title, image, background). default is NO. animated is NO
@property(nonatomic,retain)            UIColor      *selectedColor;
@property(nonatomic,retain)            UIColor      *normalColor;
@property(nonatomic,retain)            UIColor      *backgroundColor;
@property(nonatomic,retain)            UIImage      *backgroundImage;
@property(nonatomic,retain)            UIImage      *selectedImage;
@property(nonatomic,retain)            UILabel      *textLabel;
@property(nonatomic,retain)            UIImageView  *backgroundView;

-(id)initWithStatus:(BOOL)selected text:(NSString *)content selectedColor:(UIColor *)sColor normalColor:(UIColor *)nColor backgroundColor:(UIColor *)bColor indexPath:(NSIndexPath *)indexPath backgroundImage:(UIImage *)bImage selectedImage:(UIImage *)sImage;
-(void)resetFrame:(CGRect)_frame;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated;                     // animate between regular and selected state



@end
