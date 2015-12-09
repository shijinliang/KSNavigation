//
//  KSMainViewController.m
//  Navigation
//
//  Created by 史金亮 on 15/12/9.
//  Copyright © 2015年 kamy. All rights reserved.
//

#import "KSMainViewController.h"
#import "KSFirstViewController.h"
#import "KSSecondViewController.h"

@interface KSMainViewController ()
@property(nonatomic, strong) UIButton *firstBtn;
@property(nonatomic, strong) UIButton *secondBtn;
@end

@implementation KSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"KSMainView";
    [self.view addSubview:self.firstBtn];
    [self.view addSubview:self.secondBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载
- (UIButton *)firstBtn
{
    if (_firstBtn == nil) {
        _firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_firstBtn setTitle:@"FirstBtn" forState:UIControlStateNormal];
        [_firstBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _firstBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _firstBtn.frame = CGRectMake(20, 80, 80, 50);
        [_firstBtn addTarget:self action:@selector(showFirstView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _firstBtn;
}

- (UIButton *)secondBtn
{
    if (_secondBtn == nil) {
        _secondBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_secondBtn setTitle:@"SecondBtn" forState:UIControlStateNormal];
        [_secondBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _secondBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _secondBtn.frame = CGRectMake(200, 80, 80, 50);
        [_secondBtn addTarget:self action:@selector(showSecondView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondBtn;
}

#pragma mark - click
- (void)showFirstView
{
    [self.navigationController pushViewController:[[KSFirstViewController alloc]init] animated:YES];
}

- (void)showSecondView
{
    [self.navigationController pushViewController:[[KSSecondViewController alloc]init] animated:YES];
}

@end
