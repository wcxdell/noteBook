//
//  ListViewController.m
//  noteBook
//
//  Created by 王长旭 on 15/8/25.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListViewController.h"

@interface ListViewController()

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].statusBarHidden = YES;
}

-(BOOL)prefersStatusBarHidden{
    return true;
}

@end
