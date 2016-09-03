//
//  ServeManager.h
//  Chat_Inner
//
//  Created by lanyer on 16/8/27.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"
#import "XMPPStream.h"
@interface ServeManager : NSObject

@property (nonatomic,copy) void (^didLogin)();//代码块 告诉视图登陆成功 发送上线通知
+(instancetype)sharedManager;


-(void)loginWithName:(NSString *)username Password:(NSString *)password;//登入
-(void)registerWithName:(NSString *)username Password:(NSString *)password;//注册

-(void)online;//上线
-(void)offline;//下线
-(BOOL)islogin;
-(void)autologin;
-(void)logout;

@end