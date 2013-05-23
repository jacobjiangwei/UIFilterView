//
//  DemoViewController.h
//  UIFilterViewDemo
//
//  Created by jacob QQ: 110773265 on 13-5-22.
//  Copyright (c) 2013年 jacob QQ: 110773265. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIFilterView.h"



@interface DemoViewController : UIViewController <UIFilterViewDataSource,UIFilterViewDelegate>
{
    UIImage  *_cellSelectedImage;
    UIImage *_cellbackgroundImage;
}

@property(nonatomic,retain) UIImage *cellSelectedImage;

@property(nonatomic,retain) UIImage *cellbackgroundImage;
@end
