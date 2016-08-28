//
//  AccountViewController.m
//  
//
//  Created by lanyer on 16/8/27.
//
//

#import "AccountViewController.h"
#import "UIView+Responder.h"
@implementation AccountViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //键盘位置 大小发生改变
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardChanged:) name:UIKeyboardDidChangeFrameNotification object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
}
//根据键盘高度调整界面
-(void)keyboardChanged:(NSNotification *)notification{
    NSLog(@"%@",notification.userInfo);
    
    UIView *fView = [self.view firstResponder];
    CGFloat fy = CGRectGetMaxY(fView.frame);
    
    CGRect endFrame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    CGFloat delta = endFrame.origin.y - fy - 20;
    if (delta < 0) {
        self.view.center = CGPointMake(self.view.center.x, self.view.center.y + delta );
    }
    else{
        self.view.center = CGPointMake(self.view.center.x, self.view.bounds.size.height/2);
    }
}
//将注册和登入共有的功能写在同一个类的时候 可以节省代码
- (IBAction)didTap:(UITapGestureRecognizer *)sender {
    UIView *v = [self.view firstResponder];
    NSLog(@"%@",v);
    
    [self.view endEditing:YES];
}
@end
