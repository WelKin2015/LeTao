//
//  CityListViewController.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/13.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "CityListViewController.h"
#import "CityListViewModel.h"

@interface CityListViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** CityListViewModel*/
@property (nonatomic,strong) CityListViewModel *cityListVM;
@end

@implementation CityListViewController

#pragma mark - LazyLoad
-(CityListViewModel *)cityListVM {
    if (!_cityListVM) {
        _cityListVM = [CityListViewModel new];
    }
    return _cityListVM;
}

#pragma mark - UITableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cityListVM.sectionNumber ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.cityListVM rowNmuberForSection:section];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.cityListVM titleForSection:section];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.cityListVM titleForRowAtIndexPath:indexPath];
    NSString *currentCity = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentCityName];
    cell.accessoryType =  [currentCity isEqualToString:cell.textLabel.text] ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //仅仅在内存中存储了当前城市名称
    [[NSUserDefaults standardUserDefaults] setObject:[self.cityListVM titleForRowAtIndexPath:indexPath] forKey:kCurrentCityName];
    //立刻把内存中的修改存入沙盒
    [[NSUserDefaults standardUserDefaults] synchronize];
    //发送全局通知
    [[NSNotificationCenter defaultCenter] postNotificationName:kCurrentCityChangeNotification object:nil];
    [tableView reloadData];
}

//右侧索引值
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.cityListVM.indexList;
}

#pragma mark - 方法
- (IBAction)dismissVC:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.cityListVM getCityGroupsCompletionHandler:^(NSError *error) {
        [_tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
