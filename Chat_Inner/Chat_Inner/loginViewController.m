//
//  loginViewController.m
//  Chat_Inner
//
//  Created by lanyer on 16/8/27.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()
- (IBAction)didlogin:(UIButton *)sender;
- (IBAction)didTap:(UITapGestureRecognizer *)sender;

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didlogin:(UIButton *)sender {
    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewCtrl = [stroyboard instantiateInitialViewController];
    self.view.window.rootViewController = viewCtrl;
}

- (IBAction)didTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
@end
