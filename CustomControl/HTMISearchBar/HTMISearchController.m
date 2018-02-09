//
//  HTMISearchController.m
//  HTMISearchController
//
//  Created by wlq on 2017/12/4.
//  Copyright © 2017年 wlq. All rights reserved.
//

#import "HTMISearchController.h"

@interface HTMISearchController ()

@end

@implementation HTMISearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dimsBackgroundDuringPresentation = NO;
}

- (instancetype)initWithSearchResultsController:(UIViewController *)searchResultsController searchBarFrame:(CGRect)searchBarFrame placeholder:(NSString *)placeholder textFieldLeftView:(UIImageView *)leftView showCancelButton:(BOOL)showCancelButton barTintColor:(UIColor *)barTintColor{
    if (self = [super initWithSearchResultsController:searchResultsController]) {
        self.htmiSearchBar = [[HTMISearchBar alloc] initWithFrame:searchBarFrame
                                                  placeholder:placeholder
                                            textFieldLeftView:leftView
                                             showCancelButton:YES
                                                    tintColor:barTintColor];
        
        UIButton *button = [self.htmiSearchBar valueForKey:@"cancelButton"];
        button.tintColor = [UIColor whiteColor];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [self.htmiSearchBar setValue:button forKey:@"cancelButton"];
    }
    return self;
}


@end
