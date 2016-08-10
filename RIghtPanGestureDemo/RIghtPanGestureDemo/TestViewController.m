//
//  TestViewController.m
//  RIghtPanGestureDemo
//
//  Created by 付凯 on 16/8/10.
//  Copyright © 2016年 fukai. All rights reserved.
//

#import "TestViewController.h"
#import "UIColor+Random.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor randomColor];
    self.title = [NSString stringWithFormat:@"页面%ld",(long)self.number];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 50, 30);
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor randomColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)push
{
    TestViewController * testVC = [[TestViewController alloc]init];
    testVC.number = self.number + 1;
    [self.navigationController pushViewController:testVC animated:YES];
}

- (BOOL)gestureRecognizerShouldBegin
{
    if (_number == 2) {
        return NO;
    }
    return [super gestureRecognizerShouldBegin];
}

@end
