//
//  HTMIMultipleAssociatedPickerView.h
//  HTMIUsefulPickerView
//
//  Created by ZeroJ on 16/9/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HTMIToolBar;
@interface HTMIMultipleAssociatedPickerView : UIView
typedef void(^MultipleAssoCiatedDoneHandler)(NSArray *selectedValues);
typedef void(^MultipleAssociatedSelectedHandler)(NSArray *selectedValues);

typedef void(^BtnAction)();
@property (strong, nonatomic, readonly) HTMIToolBar *toolBar;
- (instancetype)initWithToolBarText:(NSString *)toolBarText withDefaultValues: (NSArray *)defaultValues withData:(NSArray *)data withValueDidChangedHandler:(MultipleAssociatedSelectedHandler)valueDidChangeHandler cancelAction:(BtnAction)cancelAction doneAction: (MultipleAssoCiatedDoneHandler)doneAction;
@end
