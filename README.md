UIFilterView
============

筛选器自定义控件写得忒麻烦，写个标准化的，跟uitableview一样好用简单
http://cc.cocimg.com/bbs/attachment/Fid_6/6_652_1038c5160a3240c.png


基本工作就是把UIFilterView UIFilterViewCell拷贝拖入项目即可

使用方法可以参考demoViewController，不过仔细看看UIFilterView.h你就明白你需要怎么做了，基本跟uitableview一致，不过简单点儿


贴上部分代码：

    UIFilterView *demoVC=[[UIFilterView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    demoVC.datasource=self;
    demoVC.delegate=self;
    demoVC.supportSectionTitle=YES;//支持标题介绍类别，诸如“按地区”分类，NO则没这个功能
    demoVC.backgroundImage =[UIImage imageNamed:@"bg_change_pwd.png"];//如果想偷懒，同一个整体色背景算了，字体直接变色代表被选中，这里弄个背景图就可以。图片不设定也没关系。
    [self.view addSubview:demoVC];
    [demoVC reloadData];
    
然后实现各种delegate即可。。
