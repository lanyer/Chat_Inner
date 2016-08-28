//
//  ServeManager.m
//  Chat_Inner
//
//  Created by lanyer on 16/8/27.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "ServeManager.h"
#import "Common.h"

@interface ServeManager ()<XMPPStreamDelegate>
{
    XMPPStream  *_xmppStream;
    
    NSString *_username;
    NSString *_password;
    
    NSInteger connectType;//0(default), 1(login), 2(register) 已经连接上服务器  判断是登入还是注册
    
}//声明一个全局变量

@end

@implementation ServeManager

+(instancetype)sharedManager{
    static ServeManager *shareInstance  = nil;//声明一个静态变量存储唯一的对象
    //判断对象是否存在 不存在则创建 过程中 判断在多线程环境下 也要安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[ServeManager alloc]init];
    });                             //dispatch once 内方法只会创建一次
    return shareInstance;
}

//创建xmppstrema 对象
-(id)init{
    if (self = [super init]) {
        _xmppStream = [[XMPPStream  alloc]init];
        //创建stream 对象
        _xmppStream.hostName = @"vpn.wuqiong.tk";//配置服务器对象  ！！！！！！！！！！！！！！！！！！！！！！！！！
        [_xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
        //配置
        [self config];
    }
    return self;
}

-(void)config
{
    
}
//登陆
-(void)loginWithName:(NSString *)username Password:(NSString *)password{
    
    _username = username;
    _password = password;//保存用户名和密码
    
    if([_xmppStream isConnected]){
        
        [_xmppStream authenticateWithPassword:password error:nil];
    }//如果已经建立了连接 填入密码即能登陆
    else{
        connectType = 1;//登陆
        _xmppStream.myJID = [XMPPJID jidWithString:[username stringByAppendingString:@"vpn.wuqiong.tk"]];
        [_xmppStream connectWithTimeout:60 error:nil];
    }
}

//注册
-(void)registerWithName:(NSString *)username Password:(NSString *)password{
    _username = username;
    _password = password;
    if([_xmppStream isConnected]){
        [_xmppStream registerWithPassword:password error:nil];
    }//如果已经建立了连接 填入密码即能登陆
    else{
        connectType = 2;//注册
        _xmppStream.myJID = [XMPPJID jidWithString:[username stringByAppendingString:@"vpn.wuqiong.tk"]];
        [_xmppStream connectWithTimeout:60 error:nil];
    }
}

#pragma mark - XMPPStreamDelegate

//连接服务器主要用到的方法
- (void)xmppStreamWillConnect:(XMPPStream *)sender{
    NSLog(@"开始连接服务器...");
}

- (void)xmppStreamDidConnect:(XMPPStream *)sender{
    NSLog(@"已经连接上服务器...");
    switch (connectType) {
        case 0:
            break;
        case 1:
            [self loginWithName:_username Password:_password];
        case 2:
            [self registerWithName:_username Password:_password];
        default:
            break;
    }
    connectType = 0;//恢复默认状态
}
- (void)xmppStreamConnectDidTimeout:(XMPPStream *)sender{
    NSLog(@"连接超时...");
     connectType = 0;//恢复默认状态
}
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error{
    NSLog(@"断开连接...");
}

#pragma marl - 登入
//登入服务器
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender{
    NSLog(@"登陆成功...");
    if (self.didLogin) {
        self.didLogin();
    }//判断是否有block对象
    [self online];//登入成功发送上线
    

}

/**
 * This method is called if authentication fails.
 **/
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(NSXMLElement *)error{
    NSLog(@"登陆失败...%@",error);
    //登陆失败后 因断开连接 才能进行第二次登陆
    [sender disconnect];
}

#pragma marl -注册
-(void)xmppStreamDidRegister:(XMPPStream *)sender{
    NSLog(@"注册成功...");
    [[NSNotificationCenter defaultCenter]postNotificationName:kRegisterNotif object:nil userInfo:@{@"success":@(YES)}];
}

- (void)xmppStream:(XMPPStream *)sender didNotRegister:(NSXMLElement *)error{
    NSLog(@"注册失败...%@",error);
    //注册失败后 因断开连接 才能进行第二次登陆
    [sender disconnect];
    [[NSNotificationCenter defaultCenter]postNotificationName:kRegisterNotif object:nil userInfo:@{@"success":@(NO)}];
}

-(void)online{
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"on"];
    [_xmppStream sendElement:presence];
}

-(void)offline{
    XMPPPresence *presence = [XMPPPresence presenceWithType:@"off"];
    [_xmppStream sendElement:presence];
}

@end

