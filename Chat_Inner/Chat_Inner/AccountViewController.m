//
//  AccountViewController.m
//  
//
//  Created by lanyer on 16/8/27.
//
//

#import "AccountViewController.h"

@implementation AccountViewController

//将注册和登入共有的功能写在同一个类的时候 可以节省代码
- (IBAction)didTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
@end
