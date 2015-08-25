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
    
    [self initWithText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initWithText{
    self.textView.layer.borderWidth = 0.5;
    self.textView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.textView.layer.cornerRadius = 2.0;
    
    self.textField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.textField.layer.borderWidth = 0.5;
    self.textField.layer.cornerRadius = 2.0;
}

-(BOOL) prefersStatusBarHidden{
    return true;
}

@end
