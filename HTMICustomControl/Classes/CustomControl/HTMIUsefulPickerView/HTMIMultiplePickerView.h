//
//  HTMIMultiplePickerView.h
//  HTMIUsefulPickerView
//
//  Created by ZeroJ on 16/9/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HTMIToolBar;

@interface HTMIMultiplePickerView : UIView
typedef void(^MultipleDoneHandler)(NSArray *selectedIndexs, NSArray *selectedValues);
typedef void(^MultipleSelectedHandler)(NSArray *selectedValues);

typedef void(^BtnAction)();

@property (strong, nonatomic, readonly) HTMIToolBar *toolBar;

- (instancetype)initWithToolBarText:(NSString *)toolBarText withDefaultIndexs: (NSArray *)defaultIndexs withData:(NSArray<NSArray<NSString *> *> *)data withValueDidChangedHandler:(MultipleSelectedHandler)valueDidChangeHandler cancelAction:(BtnAction)cancelAction doneAction: (MultipleDoneHandler)doneAction;
@end
