//
//  FKNavigationController.m
//  RIghtPanGestureDemo
//
//  Created by 付凯 on 16/8/10.
//  Copyright © 2016年 fukai. All rights reserved.
//

#import "FKNavigationController.h"
#import "FKBaseViewController.h"

@interface FKNavigationController ()<UIGestureRecognizerDelegate>

@property (nonatomic, assign) BOOL enableRightGesture;

@end

@implementation FKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.enableRightGesture = YES;
    self.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.topViewController isKindOfClass:[FKBaseViewController class]]) {
        if ([self.topViewController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
            FKBaseViewController *vc = (FKBaseViewController *)self.topViewController;
            self.enableRightGesture = [vc gestureRecognizerShouldBegin];
        }
    }else{
        return NO;
    }
    
    return self.enableRightGesture;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[FKBaseViewController class]]) {
        if ([viewController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
            FKBaseViewController *vc = (FKBaseViewController *)viewController;
            self.enableRightGesture = [vc gestureRecognizerShouldBegin];
        }
    }
    
    [super pushViewController:viewController animated:YES];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    self.enableRightGesture = YES;
    return [super popToRootViewControllerAnimated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    if (self.viewControllers.count == 1) {
        self.enableRightGesture = YES;
    } else {
        NSUInteger index = self.viewControllers.count - 2;
        UIViewController *destinationController = [self.viewControllers objectAtIndex:index];
        if ([destinationController isKindOfClass:[FKBaseViewController class]]) {
            if ([destinationController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
                FKBaseViewController *vc = (FKBaseViewController *)destinationController;
                self.enableRightGesture = [vc gestureRecognizerShouldBegin];
            }
        }
    }
    
    return [super popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count == 1) {
        self.enableRightGesture = YES;
    } else {
        UIViewController *destinationController = viewController;
        if ([destinationController isKindOfClass:[FKBaseViewController class]]) {
            if ([destinationController respondsToSelector:@selector(gestureRecognizerShouldBegin)]) {
                FKBaseViewController *vc = (FKBaseViewController *)destinationController;
                self.enableRightGesture = [vc gestureRecognizerShouldBegin];
            }
        }
    }
    
    return [super popToViewController:viewController animated:animated];
}

@end
