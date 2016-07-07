//
//  ViewController.m
//  ScanCode
//
//  Created by Oma-002 on 16/7/7.
//  Copyright © 2016年 com.tjl.org. All rights reserved.
//

#import "ViewController.h"
#import "ScanViewController.h"

#pragma mark -- 屏幕宽高
#define WIDTH [[UIScreen mainScreen] bounds].size.width
#define HEIGHT [[UIScreen mainScreen] bounds].size.height

@interface ViewController ()

@property (strong, nonatomic) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二维码扫描";
    [self.view addSubview:self.button];
}

- (UIButton *)button {
    if (!_button) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH/2 - 70, HEIGHT/2 - 22.5, 140, 45)];
        [_button setTitle:@"扫一扫" forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor redColor]];
        _button.layer.cornerRadius = 5;
        _button.layer.masksToBounds = YES;
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (void)buttonClicked:(UIButton *)sender {
    ScanViewController *scanVC = [[ScanViewController alloc] initWithComplete:^(NSString *serialNumber) {
        NSLog(@"扫描到的二维码为------：%@",serialNumber);
    }];
    [self.navigationController pushViewController:scanVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
