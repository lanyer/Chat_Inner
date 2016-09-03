//
//  AddFriendViewController.m
//  Chat_Inner
//
//  Created by lanyer on 16/9/3.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "AddFriendViewController.h"
#import "ServeManager.h"
@interface AddFriendViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextfield;
- (IBAction)didAddClick:(UIButton *)sender;

@end

@implementation AddFriendViewController

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

- (IBAction)didAddClick:(UIButton *)sender {
    if (_nameTextfield.text.length) {
        [[ServeManager sharedManager]addFriend:_nameTextfield.text];
    }
}
@end
