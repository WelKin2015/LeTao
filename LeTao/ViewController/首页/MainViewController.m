//
//  MainViewController.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/12.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewModel.h"
#import "BusinessCell.h"
#import "BusinessViewModel.h"
#import "WebViewController.h"

#define kItemIconTag    100
#define kItmeLabelTag   200

@interface MainViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cityBarItem;


/** 计算属性*/
@property (nonatomic) CGFloat lineSpaces;

/** MainViewModel*/
@property (nonatomic,strong) MainViewModel *mainVM;

/** BussinessViewModel属性*/
@property (nonatomic,strong) BusinessViewModel *businessVM;
/** 存储当前选中的类别名称*/
@property (nonatomic,strong) NSString *category;
@end

@implementation MainViewController

#pragma mark - LazyLoad
//这种通过计算返回值的属性，称为计算属性
-(CGFloat)lineSpaces {
    /*
     设 边距 = x, 间隔 = y, 屏幕宽=width
     解: y = 2x;
     2x + 3y + 4*60 = width;
     求:y?
     y + 3y = width - 4*60;
     4y = width - 4*60;
     y = (width - 4*60)/4;
     */
    return  (kScreenW - 4*60)/4;
}

-(MainViewModel *)mainVM {
    if (!_mainVM) {
        _mainVM = [MainViewModel new];
    }
    return _mainVM;
}

-(BusinessViewModel *)businessVM {
    if (!_businessVM) {
        _businessVM = [BusinessViewModel new];
    }
    return _businessVM;
}


#pragma mark - UICollectionView Delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.mainVM.rowNumber;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"item" forIndexPath:indexPath];
    UIImageView *iconIV = (UIImageView *)[cell.contentView viewWithTag:kItemIconTag];
    UILabel *titleLabel = (UILabel *)[cell.contentView viewWithTag:kItmeLabelTag];
    iconIV.image  = [UIImage imageNamed:[self.mainVM iconNameForIndex:indexPath.row]];
    titleLabel.text = [self.mainVM titleForIndex:indexPath.row];
    return cell;
}

//collectionView的行空间
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return self.lineSpaces;
}
//collectionView的列空间
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(15, self.lineSpaces/2, 15, self.lineSpaces/2);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.category = [self.mainVM titleForIndex:indexPath.row];
    [self.view showBusyHUD];
    [self.businessVM getBusinessWithCateory:self.category requestMode:RequestModeFresh completionHandler:^(NSError *error) {
        [self.view hideBusyHUD];
        if (error) {
            [self.view showWarning:error.localizedDescription];
        }else {
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _collectionView) {
        _pageControl.currentPage = _collectionView.contentOffset.x / kScreenW + 0.5;
    }
}

#pragma mark - UITableView Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.businessVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BusinessCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    cell.titleLabel.text = [self.businessVM shopNumberForIndex:row];
    [cell.iconIV setImageURL:[self.businessVM iconURLForIndex:row]];
    cell.saledNumberLabel.text = [self.businessVM saledNumberForIndex:row];
    //cell.priceLabel.text = [self.businessVM currentPriceForIndex:row];
    //调用带属性字符串的方法
    cell.price = [self.businessVM currentPriceForIndex:row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController *webMVC = [[WebViewController alloc]initWithURL:[self.businessVM businessURLForIndex:indexPath.row]];
    [self.navigationController pushViewController:webMVC animated:YES];
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.category = @"美食";
    self.cityBarItem.title = kCurrentCity;

    [self.mainVM getMenuData:^(NSError *error) {
        //15 / 8 = 1
        //15 % 8 > 0  = 1(真)
        _pageControl.numberOfPages = _mainVM.rowNumber/8 + (_mainVM.rowNumber%8 > 0) ;
        [_collectionView reloadData];
    }];
    /**
     *  监听添加的原则
     *  一定有添有删
     viewWillAppear -> viewWillDisappear
     viewDidAppear -> viewDidDisappear
     viewDidLoad -> viewDidUnload(抛弃)->改为dealloc
     */
    //监听城市变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChanged:) name:kCurrentCityChangeNotification object:nil];
    //添加下拉刷新操作
    [self.tableView addHeaderRefresh:^{
        [self.businessVM getBusinessWithCateory:self.category requestMode:RequestModeFresh completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            }else {
                [self.tableView reloadData];
            }
            [self.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    //添加下拉加载更多
    [self.tableView addBackFooterRefresh:^{
        [self.businessVM getBusinessWithCateory:self.category requestMode:RequestModeMore completionHandler:^(NSError *error) {
            if (error) {
                [self.view showWarning:error.localizedDescription];
            }else{
                [self.tableView reloadData];
            }
            [self.tableView endFooterRefresh];
        }];
    }];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 方法
-(void)cityChanged :(NSNotification *)notification {
    self.cityBarItem.title = kCurrentCity;
}


@end
