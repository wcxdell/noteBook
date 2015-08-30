//
//  CreateViewController.h
//  noteBook
//
//  Created by 王长旭 on 15/8/30.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSString* content;
@property (nonatomic,assign) NSInteger rowNo;

@end
