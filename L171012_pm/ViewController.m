//
//  ViewController.m
//  L171012_pm
//
//  Created by LinYan on 12/10/2017.
//  Copyright © 2017 LinYan. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController_one.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //打印info.plist中的内容
    NSString* File = [[NSBundle mainBundle] pathForResource:@"Info" ofType:@"plist"];
    NSMutableDictionary* dict = [[NSMutableDictionary alloc] initWithContentsOfFile:File];
    NSLog(@"==%@",dict);
    //控件相关属性设置
    [self.changeInput setAdjustsFontSizeToFitWidth:YES];
    [self.changeButton setBackgroundColor:[UIColor lightGrayColor]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)butClick:(id)sender {
    [self addAlertViewController];
}
//跳转uitabView
- (IBAction)gotoTabView:(id)sender {
    TableViewController_one *oneContorller = [[TableViewController_one alloc] init];
//    [self presentViewController:oneContorller animated:NO completion:nil];
    
    [self.navigationController pushViewController:oneContorller animated:YES];
    //[self.navigationController popToViewController:oneContorller animated:YES];
 
    
}

-(void) addAlertViewController{
 //uiAlertView ios9.0之后被弃，所以使用UIAlertViewController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"I am lucky " message:@"What ? ? ?" preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self.changeInput setText:@"对的，你是的"];
        NSLog(@"对的，你是的");
    }];
    
    UIAlertAction *heheAction = [UIAlertAction actionWithTitle:@"hehe" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        [self.changeInput setText:@"呵呵呵哒"];
        NSLog(@"呵呵呵哒");
    }];
    
    UIAlertAction *cancelAction =[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction * action) {
         [self.changeInput setText:@"不是的，你不是"];
        NSLog(@"不是的，你不是");
    }];
    
    [alertController addAction:okAction];
    [alertController addAction:heheAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

@end
