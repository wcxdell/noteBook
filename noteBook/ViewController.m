//
//  ViewController.m
//  noteBook
//
//  Created by 王长旭 on 15/8/25.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].statusBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL) prefersStatusBarHidden{
    return true;
}

@end
