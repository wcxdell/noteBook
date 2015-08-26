//
//  ListViewController.h
//  noteBook
//
//  Created by 王长旭 on 15/8/26.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface ListViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray * name;
@property (nonatomic,strong) NSMutableArray * content;
//@property (strong, nonatomic) IBOutlet UINavigationItem *navi;

@end
