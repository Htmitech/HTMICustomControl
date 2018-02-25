//
//  HTMIDatePickerView.m
//  HTMIUsefulPickerView
//
//  Created by ZeroJ on 16/9/10.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "HTMIDatePickerView.h"
#import "HTMIToolBar.h"


@implementation HTMIDatePickerStyle
- (instancetype)init {
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}


- (void)commonInit {
    _date = [NSDate date];
    _datePickerMode = UIDatePickerModeDate;
    _locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];

}

@end

@interface HTMIDatePickerView () {
    NSDate *_selectedDate;
}
@property (strong, nonatomic) HTMIToolBar *toolBar;
@property (strong, nonatomic) UIDatePicker *pickerView;
@property (strong, nonatomic) HTMIDatePickerStyle *style;
@property (copy, nonatomic) DateSelectedHandler valueDidChangeHandler;

@end

@implementation HTMIDatePickerView

#pragma mark - life cycle
- (instancetype)initWithToolBarText:(NSString *)toolBarText withStyle: (HTMIDatePickerStyle *)style withValueDidChangedHandler:(DateSelectedHandler)valueDidChangedHandler cancelAction:(BtnAction)cancelAction doneAction: (DateDoneHandler)doneAction {
    
    if (self = [super init]) {
        // 默认为当前时间
        _selectedDate = [NSDate date];
        _style = style;
        _valueDidChangeHandler = valueDidChangedHandler;
        __weak typeof(self) weakSelf = self;
        _toolBar = [[HTMIToolBar alloc] initWithToolbarText:toolBarText cancelAction:cancelAction doneAction:^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (strongSelf) {
                if (doneAction) {
                    doneAction(strongSelf->_selectedDate);
                }

            }
        }];
        self.backgroundColor = [UIColor whiteColor];

        [self addSubview:_toolBar];
        [self addSubview:self.pickerView];
        /// 选中日期改变
        [self setupSelectedValueDidChanged];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat kToolBarHeight = 44.0f;
    
    
    NSLayoutConstraint *toolBarLeft = [NSLayoutConstraint constraintWithItem:self.toolBar attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0f];
    NSLayoutConstraint *toolBarRight = [NSLayoutConstraint constraintWithItem:self.toolBar attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *toolBarHeight = [NSLayoutConstraint constraintWithItem:self.toolBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:kToolBarHeight];
    NSLayoutConstraint *toolBarTop = [NSLayoutConstraint constraintWithItem:self.toolBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0f];
    self.toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:@[toolBarLeft, toolBarRight, toolBarHeight, toolBarTop]];
    
    NSLayoutConstraint *pickerViewLeft = [NSLayoutConstraint constraintWithItem:self.pickerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0.0f];
    NSLayoutConstraint *pickerViewRight = [NSLayoutConstraint constraintWithItem:self.pickerView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0.0f];
    
    NSLayoutConstraint *pickerViewHeight = [NSLayoutConstraint constraintWithItem:self.pickerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.bounds.size.height - kToolBarHeight];
    NSLayoutConstraint *pickerViewBottom = [NSLayoutConstraint constraintWithItem:self.pickerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0f];
    self.pickerView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addConstraints:@[pickerViewLeft, pickerViewRight, pickerViewHeight, pickerViewBottom]];
}

- (void)dealloc {
//    HTMILogInfo(@"HTMIDatePickerView ===== dealloc");
}

- (void)setupSelectedValueDidChanged {
    if (_valueDidChangeHandler) {
        _valueDidChangeHandler(_selectedDate);
    }
}
- (void)datePickerDidSelected:(UIDatePicker *)datePicker {
    _selectedDate = datePicker.date;
    [self setupSelectedValueDidChanged];
    
}

- (UIDatePicker *)pickerView {
    if (!_pickerView) {
        UIDatePicker *picker = [UIDatePicker new];
        [picker addTarget:self action:@selector(datePickerDidSelected:) forControlEvents:UIControlEventValueChanged];
        picker.datePickerMode = UIDatePickerModeDate;
        picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
        if (_style) {
            picker.date = _style.date;
            picker.minimumDate = _style.minimumDate;
            picker.maximumDate = _style.maximumDate;
            picker.datePickerMode = _style.datePickerMode;
            picker.locale = _style.locale;
            /// 设置默认选中值
            _selectedDate = _style.date;
        }

        _pickerView = picker;
    }
    return _pickerView;
}
@end
