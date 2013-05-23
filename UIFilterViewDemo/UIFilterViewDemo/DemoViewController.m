//
//  DemoViewController.m
//  UIFilterViewDemo
//
//  Created by jacob QQ: 110773265 on 13-5-22.
//  Copyright (c) 2013年 jacob QQ: 110773265. All rights reserved.
//

#import "DemoViewController.h"
#import "UIFilterViewCell.h"
#import "UIFilterView.h"

@interface DemoViewController ()

@end

@implementation DemoViewController

@synthesize cellbackgroundImage=_cellbackgroundImage;
@synthesize cellSelectedImage=_cellSelectedImage;

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
    _cellSelectedImage=[UIImage imageNamed:@"bg_menu_sel.png"];//如果想设定每一行cell背景图、选中图，请初始化通用的图片在这里
    _cellbackgroundImage=[UIImage imageNamed:@"menu_bg.png"];
    
    UIFilterView *demoVC=[[UIFilterView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    demoVC.datasource=self;
    demoVC.delegate=self;
    demoVC.supportSectionTitle=YES;//支持标题介绍类别，诸如“按地区”分类，NO则没这个功能
    demoVC.backgroundImage =[UIImage imageNamed:@"bg_change_pwd.png"];//如果想偷懒，同一个整体色背景算了，字体直接变色代表被选中，这里弄个背景图就可以。图片不设定也没关系。
    [self.view addSubview:demoVC];
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
    return 60.0f;
}

- (void)filterView:(UIFilterView *)filterView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"taped indexpath is section %d row %d",(int)indexPath.section,(int)indexPath.row);
    //接下来你该刷新被筛选的对象了
}

#pragma mark datasource
- (NSInteger)numberOfSectionsInFilterView:(UIFilterView *)filterView  //总行数
{
    return 9;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section  // 每一行有几列,你该准备几个数组，根据section判断多少列
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

-(CGFloat)lengthForSectionHeader:(NSInteger)section  
{
    return 70.0f;
    
}

- (NSString *)filterView:(UIFilterView *)filterView titleForSection:(NSInteger)section //每一行的标题  诸如：按类型、按地区、按年代等等 你该准备几个数组，根据section判断多少列
{
    switch (section) {
        case 1:
            return @"按地区";
            break;
        case 2:
            return @"按年代";
            break;
        case 3:
            return @"按国籍";
            break;
            
        default:
            return @"按长短";
            break;
    }
}


- (UIFilterViewCell *)filterView:(UIFilterView *)filterView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //这里该弄个数组，返回字符串
    //这里cell背景图本来想弄，弄了太丑，就传了nil。。见谅
    UIFilterViewCell *cell=[[UIFilterViewCell alloc]initWithStatus:NO text:@"选项1" selectedColor:[UIColor redColor] normalColor:[UIColor blackColor] backgroundColor:[UIColor clearColor] indexPath:indexPath backgroundImage:nil selectedImage:_cellSelectedImage];
    return cell;
}

@end
