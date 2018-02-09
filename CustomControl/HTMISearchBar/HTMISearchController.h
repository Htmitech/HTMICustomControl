//
//  HTMISearchController.h
//  HTMISearchController
//
//  Created by wlq on 2017/12/4.
//  Copyright © 2017年 wlq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTMISearchBar.h"

@interface HTMISearchController : UISearchController

@property (nonatomic, strong) HTMISearchBar *htmiSearchBar;

- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController searchBarFrame:(CGRect)frame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton barTintColor:(UIColor *)barTintColor;

@end
