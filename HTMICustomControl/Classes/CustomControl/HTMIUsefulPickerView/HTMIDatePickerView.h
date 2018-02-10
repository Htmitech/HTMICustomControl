//
//  HTMIDatePickerView.h
//  HTMIUsefulPickerView
//
//  Created by ZeroJ on 16/9/10.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTMIToolBar;

@interface HTMIDatePickerStyle : NSObject
/** 显示样式 默认为显示年月日 UIDatePickerModeDate*/
@property (nonatomic) UIDatePickerMode datePickerMode;
/** 显示的默认时间*/
@property (strong, nonatomic) NSDate *date;
/** 最小时间*/
@property (strong, nonatomic) NSDate *minimumDate;
/** 最大时间*/
@property (strong, nonatomic) NSDate *maximumDate;
/** 地区, 默认为China*/
@property (strong, nonatomic) NSLocale   *locale;

@end



@interface HTMIDatePickerView : UIView

typedef void(^DateDoneHandler)(NSDate *selectedDate);
typedef void(^DateSelectedHandler)(NSDate *selectedDate);

typedef void(^BtnAction)();
@property (strong, nonatomic, readonly) HTMIToolBar *toolBar;
- (instancetype)initWithToolBarText:(NSString *)toolBarText withStyle: (HTMIDatePickerStyle *)style withValueDidChangedHandler:(DateSelectedHandler)valueDidChangedHandler cancelAction:(BtnAction)cancelAction doneAction: (DateDoneHandler)doneAction;
@end


