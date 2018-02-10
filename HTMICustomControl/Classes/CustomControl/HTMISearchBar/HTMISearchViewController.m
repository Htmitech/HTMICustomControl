//
//  HTMISearchViewController.m
//  HTMISearchController
//
//  Created by wlq on 2017/12/4.
//  Copyright © 2017年 wlq. All rights reserved.
//

#import "HTMISearchViewController.h"
#import "HTMISearchController.h"

@interface HTMISearchViewController () <UISearchBarDelegate>

@property (nonatomic, strong) HTMISearchController *htmiSearchController;

@end

@implementation HTMISearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    UILabel *label = [[UILabel alloc] init];
    label.text = @"搜索页";
    label.font = [UIFont systemFontOfSize:30];
    [label sizeToFit];
    label.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.width / 2);
    [self.view addSubview:label];
    
    UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search"]];
    leftView.bounds = CGRectMake(0, 0, 24, 24);
    self.htmiSearchController = [[HTMISearchController alloc] initWithSearchResultsController:self
                                                                           searchBarFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)
                                                                              placeholder:@"请输入搜索内容进行搜索"
                                                                        textFieldLeftView:leftView
                                                                         showCancelButton:YES
                                                                             barTintColor:[UIColor lightGrayColor]];
    
    [self.htmiSearchController.htmiSearchBar becomeFirstResponder];
    self.htmiSearchController.htmiSearchBar.delegate = self;
    [self.htmiSearchController.htmiSearchBar setLeftPlaceholder];
    self.navigationItem.titleView = self.htmiSearchController.htmiSearchBar;
    self.navigationItem.hidesBackButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.htmiSearchController.htmiSearchBar resignFirstResponder];
    // 让取消按钮一直处于激活状态
    UIButton *cancelBtn = [searchBar valueForKey:@"cancelButton"];
    cancelBtn.enabled = YES;
}

@end
