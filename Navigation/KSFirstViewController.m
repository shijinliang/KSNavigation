//
//  KSFirstViewController.m
//  Navigation
//
//  Created by 史金亮 on 15/12/9.
//  Copyright © 2015年 kamy. All rights reserved.
//

#import "KSFirstViewController.h"
#import "KSSecondViewController.h"

@interface KSFirstViewController ()

@end

@implementation KSFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"KSFirstView";
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
- (IBAction)showSecondView:(UIButton *)sender {
    [self.navigationController pushViewController:[[KSSecondViewController alloc] init] animated:YES];
}

@end
