//
//  CreateViewController.m
//  noteBook
//
//  Created by 王长旭 on 15/8/30.
//  Copyright (c) 2015年 王长旭. All rights reserved.
//

#import "CreateViewController.h"
#import "AppDelegate.h"
#import "Note.h"

@interface CreateViewController ()
@property AppDelegate * appDelegate;
@end

@implementation CreateViewController

- (void)viewDidLoad {
        [super viewDidLoad];
        [self initWithText];
        // Do any additional setup after loading the view, typically from a nib.
        [UIApplication sharedApplication].statusBarHidden = YES;
        self.navigationItem.title = @"详细内容";
        self.textView.text = self.content;
        self.textField.text = self.name;
    
    self.appDelegate = [UIApplication sharedApplication].delegate;
    
        
        
        UIBarButtonItem* rightBn = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finishCreate)];
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
        
    }
    
    -(void) finishCreate{
        [self.textView resignFirstResponder];
        [self.textField resignFirstResponder];
        Note * note = [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:self.appDelegate.managedObjectContext];
        note.name = self.textField.text;
        note.content = self.textView.text;
        
        NSError * error = nil;
        
        if(note.name!=nil && note.name.length>0&&note.content!=nil && note.content.length>0){
            if([self.appDelegate.managedObjectContext save:&error]){
                [[[UIActionSheet alloc] initWithTitle:@"保存成功" delegate:nil cancelButtonTitle:@"确定" destructiveButtonTitle:nil otherButtonTitles:nil] showInView:self.view];
            }else{
                NSLog(@"保存出错");
            }
        }else{
            NSLog(@"保存出错");
        }
    }
    
    - (IBAction)finish:(id)sender {
        [sender resignFirstResponder];
    }
    
    -(BOOL) prefersStatusBarHidden{
        return true;
    }

    // Do any additional setup after loading the view.

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
