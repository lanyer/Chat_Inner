//
//  FriendListTableViewCell.m
//  Chat_Inner
//
//  Created by lanyer on 16/9/3.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "FriendListTableViewCell.h"

@implementation FriendListTableViewCell

- (void)awakeFromNib {
    self.avatarimageView.layer.cornerRadius = 26;//设置头像为圆形 根据UI设计图 确定大小
    self.avatarimageView.layer.masksToBounds =YES;//超出部分进行切割
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
