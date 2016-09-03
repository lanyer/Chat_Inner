//
//  SettingsViewController.m
//  Chat_Inner
//
//  Created by lanyer on 16/9/3.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
- (IBAction)logoutClick:(UIButton *)sender;

@end

@implementation SettingsViewController

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

- (IBAction)logoutClick:(UIButton *)sender {
    UIStoryboard *loginStroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewCtrl = [loginStroyboard instantiateViewControllerWithIdentifier:@"loginCtrl"];
    self.view.window.rootViewController = viewCtrl;
}
@end
