//
//  loginViewController.m
//  Chat_Inner
//
//  Created by lanyer on 16/8/27.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "loginViewController.h"
#import "myServeManager.h"
#import "SVProgressHUD.h"
@interface loginViewController ()
- (IBAction)didlogin:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

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
//    UIStoryboard *stroyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController *viewCtrl = [stroyboard instantiateInitialViewController];
//    self.view.window.rootViewController = viewCtrl;
    
    [[myServeManager sharedManager]loginWithName:self.usernameTextfield.text Password:self.passwordTextfield.text];
 
    //按钮效果 
    //[SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    //[SVProgressHUD showWithStatus:@"登陆失败"];
}


-(IBAction)unwindRegister:(UIStoryboardSegue*)sender{
    
}
@end
