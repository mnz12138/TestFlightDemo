//
//  ViewController.m
//  TestFlightDemo
//
//  Created by wangquanjin on 2020/1/16.
//  Copyright © 2020 WangQuanJin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)invitationAction {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"邀请内测" message:@"恭喜你获得内测资格" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"下载" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self sureAction];
    }];
    [alertVc addAction:cancelAction];
    [alertVc addAction:sureAction];
    [self presentViewController:alertVc animated:YES completion:nil];
}
//如果用户本地没有安装TestFlight可以直接通过OpenUrl来打开该链接
- (void)sureAction {
    NSString *urlString= @"beta.itunes.apple.com/v1/invite/fb434eea632c45cc8592444f62c5c858784fa54807704b66baf9852ed21ff7bd4a45a752?ct=929467FPP6&advp=10000&platform=ios";
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"itms-beta://"]]) {//已经安装了TestFlight
        urlString = [NSString stringWithFormat:@"itms-beta://%@",urlString];
        NSURL*url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    }else{
        urlString = [NSString stringWithFormat:@"https://%@",urlString];
        NSURL*url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
