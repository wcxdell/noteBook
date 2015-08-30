//
//  ListViewController.m
//  noteBook
//
//  Created by 王长旭 on 15/8/26.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import "ListViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"
#import "Note.h"
#import "CreateViewController.h"
@interface ListViewController()
@property AppDelegate* appDelegate;
@end
@implementation ListViewController{
    ViewController * _viewController;
    CreateViewController* _createViewControoler;
    NSMutableArray * noteArray;
    Note * note;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.navigationItem.title = @"记事本列表";
    
    
    _name = [NSMutableArray arrayWithObjects:@"1", @"2",@"3",@"4",@"5",nil];
    _content = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    
    UIBarButtonItem* rightBn = [[UIBarButtonItem alloc] initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(create)];
    self.navigationItem.rightBarButtonItem = rightBn;
    
//    self.tableView.dataSource = self;
//    self.tableView.delegate = self;
    
    
//    下面这两句是用storybord上面绘制的view来直接作为viewController的页面。
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    _viewController = [storyboard instantiateViewControllerWithIdentifier:@"editNoteBook"];
    
    _createViewControoler = [storyboard instantiateViewControllerWithIdentifier:@"createViewController"];
    
//    下面这句可以不用storybord来进行viewcontroller的跳转，需要在viewcontroller上面进行绘制。
//    _viewController = [[ViewController alloc] init];
    
    
//    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
//    [button setTitle:@"玩耍" forState:UIControlStateNormal];
//    button.frame = CGRectMake(30,30,40,40);
//    [self.view addSubview:button];
    
    
//    self.navi.title = @"记事本列表";
    
    
//    _viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"editNoteBook"];
    
    
    
    self.appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    [self fetch];
//    NSLog(@"%ld",noteArray.count);
}

-(void)fetch{
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:@"Note" inManagedObjectContext:self.appDelegate.managedObjectContext];
    [request setEntity:entity];
    
    NSError* error = nil;
    noteArray = [[self.appDelegate.managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self fetch];
    [self.tableView reloadData];
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* cellId = @"cellId";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    NSUInteger rowNo = indexPath.row;
    
    note = noteArray[rowNo];
    
    cell.textLabel.text = note.name;
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    //    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    cell.detailTextLabel.text = note.content;
    return cell;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return noteArray.count;
}

-(void)tableView:(UITableView*) tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSInteger rowNo = indexPath.row;
    //    NSLog(@"123");
    
    _viewController.name = _name[rowNo];
    _viewController.content = _content[rowNo];
    _viewController.rowNo = rowNo;
    [self.navigationController pushViewController:_viewController animated:YES];
}

-(void) create{
    [self.navigationController pushViewController:_createViewControoler animated:YES];
}


-(BOOL) prefersStatusBarHidden{
    return true;
}

@end
