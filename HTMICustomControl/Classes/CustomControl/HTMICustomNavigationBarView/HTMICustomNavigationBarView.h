//
//  HTMICustomNavigationBarView.h
//  MXClient
//
//  Created by wlq on 2017/3/7.
//  Copyright © 2017年 MXClient. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTMICustomNavigationBarView : UIView

@property(nonatomic,strong)UIButton *buttonLeft;
@property(nonatomic,strong)UIButton *buttonRight;
- (id)initWithTitle:(NSString *)title;

@end

