//
//  UIView+Responder.m
//  Chat_Inner
//
//  Created by lanyer on 16/8/28.
//  Copyright (c) 2016年 lanyer. All rights reserved.
//

#import "UIView+Responder.h"

@implementation UIView (Responder)

-(UIView *)firstResponder{
    for (UIView *v in self.subviews) {
        if ([v isFirstResponder]) {
            return v;
        }
        else{
            UIView *sv = [v firstResponder];
            if (sv) {
                return sv;
            }
        }
    }
    return  nil;
}
@end
