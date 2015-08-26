//
//  ViewController.m
//  noteBook
//
//  Created by 王长旭 on 15/8/25.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithText];
    // Do any additional setup after loading the view, typically from a nib.
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.navigationItem.title = @"详细内容";
    self.textView.text = self.name;
    self.textField.text = self.content;
    self.textView.editable = NO;
    self.textField.enabled = NO;
    
    UIBarButtonItem* rightBn = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(beginEdit:)];
    self.navigationItem.rightBarButtonItem = rightBn;
    
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

-(void) beginEdit:(id) sender{
    if([[sender title] isEqualToString:@"编辑"]){
        self.textField.enabled = YES;
        self.textView.editable = YES;
        
        self.navigationItem.rightBarButtonItem.title = @"完成";
    }else{
        [self.textView resignFirstResponder];
        [self.textField resignFirstResponder];
        
        AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
        
        [appDelegate.viewController.name replaceObjectAtIndex:self.rowNo withObject:self.textView.text];
        
        [appDelegate.viewController.content replaceObjectAtIndex:self.rowNo withObject:self.textField.text];
        
        self.textField.enabled = NO;
        self.textView.editable = NO;
        
        self.navigationItem.rightBarButtonItem.title=@"编辑";
        
    }
}

- (IBAction)finish:(id)sender {
    [sender resignFirstResponder];
}

-(BOOL) prefersStatusBarHidden{
    return true;
}

@end
