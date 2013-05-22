//
//  DemoViewController.m
//  UIFilterViewDemo
//
//  Created by jacob on 13-5-22.
//  Copyright (c) 2013年 jacob. All rights reserved.
//

#import "DemoViewController.h"
#import "UIFilterViewCell.h"
#import "UIFilterView.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    UIFilterViewCell *testCell=[[UIFilterViewCell alloc]initWithStatus:NO text:@"hahahahahha" selectedColor:[UIColor redColor] normalColor:[UIColor blackColor] backgroundColor:[UIColor grayColor] indexPath:[NSIndexPath indexPathForRow:0 inSection:0] backgroundImageView:nil selectedImageView:nil];

    [testCell resetFrame:CGRectMake(100, 100, 100, 150)];
    [self.view addSubview:testCell];
     */
    UIFilterView *demoVC=[[UIFilterView alloc]initWithFrame:self.view.frame];
    demoVC.datasource=self;
    demoVC.delegate=self;
    
    [self.view addSubview:demoVC];
    [demoVC reloadData];
    [demoVC reloadData];
    [demoVC reloadData];
    [demoVC reloadData];
    [demoVC reloadData];
    [demoVC reloadData];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark delegate
- (CGFloat)heightForRowAtSection:(NSInteger)section  //不同的行，高度不同；同一行则无需区分
{
    return 30.0f;
}

- (CGFloat)lengthForRowAtSection:(NSInteger)section  //同一行，不同的列可能长度不等，譬如字太长，一般的话，直接弄个覆盖全面的长度足矣
{
    return 90.0f;
}

- (void)filterView:(UIFilterView *)filterView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark datasource
- (NSInteger)numberOfSectionsInFilterView:(UIFilterView *)filterView  //总行数
{
    return 9;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section  // 每一行有几列
{
    switch (section) {
        case 1:
            return 6;
            break;
        case 2:
            return 8;
            break;
        case 3:
            return 4;
            break;
            
        default:
            return 9;
            break;
    }
}

- (NSString *)filterView:(UIFilterView *)filterView titleForSection:(NSInteger)section //每一行的标题  诸如：按类型、按地区、按年代等等
{
    switch (section) {
        case 1:
            return @"第二行";
            break;
        case 2:
            return @"咩哈哈哈";
            break;
        case 3:
            return @"草泥马";
            break;
            
        default:
            return @"干嘛啊";
            break;
    }
}


- (UIFilterViewCell *)filterView:(UIFilterView *)filterView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIFilterViewCell *cell=[[UIFilterViewCell alloc]initWithStatus:YES text:@"test" selectedColor:[UIColor redColor] normalColor:[UIColor blackColor] backgroundColor:[UIColor whiteColor] indexPath:indexPath backgroundImageView:nil selectedImageView:nil];
    return cell;
}

@end
