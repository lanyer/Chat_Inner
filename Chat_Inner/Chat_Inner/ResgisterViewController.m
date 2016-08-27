//
//  ResgisterViewController.m
//  Chat_Inner
//
//  Created by lanyer on 16/8/27.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "ResgisterViewController.h"
#import "Common.h"
#import "SVProgressHUD.h"
@interface ResgisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *emailTextfielf;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextfield;
- (IBAction)didRegister:(UIButton *)sender;


@end

@implementation ResgisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerNotif:) name:kRegisterNotif object:nil];
    // Do any additional setup after loading the view.
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)registerNotif:(NSNotification *)notification{
    NSDictionary *userInfo = notification.userInfo;
    
    if ([userInfo[@"success"] boolValue]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil]; //weak self
        UIViewController *viewCtrl = [storyboard instantiateInitialViewController];
        self.view.window.rootViewController = viewCtrl;
    }
    else{
        //注册失败时 用SV框架 显示错误
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//验证用户是否输入用户名 密码 是否为空

-(BOOL)validate{
    return YES;
}
- (IBAction)didRegister:(UIButton *)sender {
    if (![self validate]) {
        return;
    }
}

@end
