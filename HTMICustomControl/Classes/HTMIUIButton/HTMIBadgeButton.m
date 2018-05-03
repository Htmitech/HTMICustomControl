//
//  HTMIBadgeButton.m
//  MXClient
//
//  Created by Zc on 2017/8/16.
//  Copyright © 2017年 MXClient. All rights reserved.
//

#import "HTMIBadgeButton.h"

@implementation HTMIBadgeButton


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self notificationCenter];
    }
    return self;
}

- (void)isHaveVersion:(NSNotification *)notification {
    
    BOOL isFirst = notification.userInfo[@"isHaveVersion"];
    if (isFirst == 1) {
        //表示Yes
        [self showBadgeWithStyle:WBadgeStyleRedDot value:0 animationType:WBadgeAnimTypeNone];
    }else{
        [self clearBadge];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self notificationCenter];
    }
    return self;
}

- (void)notificationCenter {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isHaveVersion:) name:@"isHaveRedDotBadge" object:nil];
}

- (void)dealloc {

    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"isHaveRedDotBadge" object:nil];
}

@end
