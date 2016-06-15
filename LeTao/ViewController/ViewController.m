//
//  ViewController.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/2.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "ViewController.h"
#import <MBProgressHUD.h>
#import <MJRefresh.h>

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
/**按钮*/
@property (nonatomic,strong) UIButton *button;
/** 属性**/
@property (nonatomic,strong) UITableView *tableView;
@end


@implementation ViewController

#pragma mark - UITableViewDelegate 
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    //三目运算：奇数行蓝色，偶数行绿色
    cell.contentView.backgroundColor = indexPath.row%2 ? [UIColor blueColor] : [UIColor greenColor];
    return cell;
}

#pragma mark - Methods方法

#pragma mark - Lazy Load

-(UITableView*)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}

-(UIButton *) button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        [_button setTitle:@"点击弹出提示" forState:UIControlStateNormal];
        
        //[_button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        //BlocksKti提供的类别都是以bk_开头
        [_button bk_addEventHandler:^(id sender) {
            NSLog(@"Hello!");
            
            //MBProgressHUD的简单使用
            //弹出提示，1.5秒后自动消失
//            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//            [hud setMode:MBProgressHUDModeText];
//            hud.labelText = @"当前无网络，请稍后再试！" ;
//            [hud hide:YES afterDelay:1.5];
            //通过扩展，将MBProgressHUD于自己的代码进行分离
            [self.view showWarning:@"当前无网络，请稍后再试"];
            
            //模仿一个5s的耗时操作，即子线程中5s后执行某个任务
            [self.view showBusyHUD];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.view hideBusyHUD];
            });
            
        } forControlEvents:UIControlEventTouchUpInside];
        
        _button.backgroundColor = [UIColor purpleColor];
        [self.view addSubview:_button];
        
        //按钮居中，宽80，高40
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            // 此块中，不允许出现frame，以make代替当前视图
            //make.center.mas_equalTo(0);
            //链式写法，读作按钮的中心=当前视图的中心，x便宜量+0，y便宜量+0
            //make.center.mas_equalTo(self.view.center).mas_equalTo(CGPointMake(0, 0));
            
            make.center.equalTo(0);
            make.size.equalTo(CGSizeMake(120, 40));
       
        }];
    }
    return _button;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //[self button];
    [self tableView];
    
    /*
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_header endRefreshing];
        });
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.tableView.mj_footer endRefreshing];
        });
    }];
     */
    //使用自定义扩展分类
    //为了解决self在block块内使用时黄色警报的问题，需要将self进行weak处理，如下格式：
    //__weak __typeof(&*self)weakSelf = self;
    WK(weakSelf);
    [self.tableView addHeaderRefresh:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView endHeaderRefresh];
        });
    }];
    [self.tableView beginHeaderRefresh];
    
}


@end
