//
//  BaseViewController.m
//  RIghtPanGestureDemo
//
//  Created by 付凯 on 16/8/10.
//  Copyright © 2016年 fukai. All rights reserved.
//

#import "FKBaseViewController.h"

@interface FKBaseViewController ()

@end

@implementation FKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)gestureRecognizerShouldBegin {
    return YES;
}

@end
