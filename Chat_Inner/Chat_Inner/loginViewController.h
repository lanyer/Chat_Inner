//
//  loginViewController.h
//  Chat_Inner
//
//  Created by lanyer on 16/8/27.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AccountViewController.h"

@interface loginViewController : AccountViewController
-(IBAction)unwindRegister:(UIStoryboardSegue*)sender;
@end
