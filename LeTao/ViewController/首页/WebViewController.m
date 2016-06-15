//
//  WebViewController.m
//  LeTao
//
//  Created by WelKin Xu on 16/6/14.
//  Copyright © 2016年 WelKin Xu. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
/** UIWebView对象*/
@property (nonatomic,strong) UIWebView *webView;
@end

@implementation WebViewController

#pragma mark - UIWebViewDelegate
-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.view showBusyHUD];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.view hideBusyHUD];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.view showWarning:error.localizedDescription];
}

#pragma mark - LazyLoad
-(UIWebView *)webView{
    if (!_webView) {
        _webView = [UIWebView new];
        _webView.delegate = self;
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _webView;
}

#pragma mark - 生命周期

-(instancetype)initWithURL:(NSURL *)webURL {
    if (self = [super init]) {
        self.webURL = webURL;
        self.hidesBottomBarWhenPushed  = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.webURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
