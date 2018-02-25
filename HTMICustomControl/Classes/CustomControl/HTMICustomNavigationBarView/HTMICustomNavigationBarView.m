//
//  HTMICustomNavigationBarView.m
//  MXClient
//
//  Created by wlq on 2017/3/7.
//  Copyright © 2017年 MXClient. All rights reserved.
//

#import "HTMICustomNavigationBarView.h"

#import "HTMISettingManager.h"

@implementation HTMICustomNavigationBarView

- (id)initWithTitle:(NSString *)title
{
    self = [super init];
    
    if (self)
    {
        self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/4.0, 22, [UIScreen mainScreen].bounds.size.width/2.0, 40);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = HTMINavigationBarTitleFontColor;
        titleLabel.font = HTMINavigationBarTitleFontSize;
        titleLabel.text = title;
        [self addSubview:titleLabel];
        
        self.buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonLeft.frame = CGRectMake(0, 22, 40, 40);
        [self addSubview:self.buttonLeft];
        self.buttonLeft.titleLabel.font = [UIFont systemFontOfSize:15];
        self.buttonLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        
        self.buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buttonRight.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 40, 22, 40, 40);
        [self addSubview:self.buttonRight];
        self.buttonRight.titleLabel.font = [UIFont systemFontOfSize:15];
        self.buttonRight.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        self.backgroundColor =  kHTMI_NavigationBarButtonColor;
    }
    
    return self;
}

@end
