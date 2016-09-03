//
//  FriendListTableViewCell.h
//  Chat_Inner
//
//  Created by lanyer on 16/9/3.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendListTableViewCell : UITableViewCell
//控件已经加载在视图上 已经强引用了  这里可以用weak
@property(nonatomic,weak) IBOutlet UIImageView *avatarimageView;
@property(nonatomic,weak) IBOutlet UILabel *nameLabel;
@property(nonatomic,weak) IBOutlet UILabel *descLabel;
@end
