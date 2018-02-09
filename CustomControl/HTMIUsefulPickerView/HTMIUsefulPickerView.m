//
//  HTMIUsefulPickerView.m
//  HTMIUsefulPickerView
//
//  Created by ZeroJ on 16/9/9.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "HTMIUsefulPickerView.h"

void ifDebug(dispatch_block_t blcok) {
#if DEBUG
    if (blcok) {
        blcok();
    }
#endif
}


@interface HTMIUsefulPickerView ()
/// 使用UIView可以代替不同类型的pickerView
@property (strong, nonatomic) UIView *pickerView;

@end

static const CGFloat kPickerViewHeight = 260.0f;

@implementation HTMIUsefulPickerView

#pragma mark - public use methods
+ (HTMIUsefulPickerView *)showSingleColPickerWithToolBarText:(NSString *)toolBarText withData :(NSArray<NSString *> *)data withDefaultIndex:(NSInteger)defaultIndex withCancelHandler:(CancelHandler)cancelHandler withDoneHandler:(SingleDoneHandler)doneHandler {
    HTMIUsefulPickerView *usefulPickerView = [HTMIUsefulPickerView new];
    
    __weak HTMIUsefulPickerView *weakUsefulPickerView = usefulPickerView;
    /// 解决循环引用的问题
    HTMISinglePickerView *single = [[HTMISinglePickerView alloc] initWithToolBarText:toolBarText withDefaultIndex:defaultIndex withData:data withValueDidChangedHandler:nil cancelAction:^{

        if (cancelHandler) {
            cancelHandler();
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            /// 移除
            [strongUsefulPickerView hidePickerView];
            
        }
        
    } doneAction:^(NSInteger selectedIndex, NSString *selectedValue){

        if (doneHandler) {
            doneHandler(selectedIndex, selectedValue);
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            /// 移除
            [strongUsefulPickerView hidePickerView];
            
        }
    }];
    /// 设置pickerView --- 在重写的set方法里面会将pickerView添加到usefulPickerView上
    usefulPickerView.pickerView = single;
    /// 弹出usefulPickerView
    [usefulPickerView showPickerView];
    /// 返回usefulPickerView --- 便于使用者自定义一些toolBar的属性
    return usefulPickerView;
}

+ (HTMIUsefulPickerView *)showMultipleColPickerWithToolBarText:(NSString *)toolBarText withDefaultIndexs: (NSArray *)defaultIndexs withData:(NSArray<NSArray<NSString *> *> *)data withCancelHandler:(CancelHandler)cancelHandler withDoneHandler: (MultipleDoneHandler)doneHandler {
    
    HTMIUsefulPickerView *usefulPickerView = [HTMIUsefulPickerView new];
    
    __weak HTMIUsefulPickerView *weakUsefulPickerView = usefulPickerView;
    HTMIMultiplePickerView *multiple = [[HTMIMultiplePickerView alloc] initWithToolBarText:toolBarText withDefaultIndexs:defaultIndexs withData: data withValueDidChangedHandler:nil cancelAction:^{
        
        if (cancelHandler) {
            cancelHandler();
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            [strongUsefulPickerView hidePickerView];
            
        }
        
    }doneAction:^(NSArray *selectedIndexs, NSArray *selectedValues) {
        if (doneHandler) {
            doneHandler(selectedIndexs, selectedValues);
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            [strongUsefulPickerView hidePickerView];
            
        }
    }];
    usefulPickerView.pickerView = multiple;
    [usefulPickerView showPickerView];
    return usefulPickerView;

}

+ (HTMIUsefulPickerView *)showMultipleAssociatedColPickerWithToolBarText:(NSString *)toolBarText withDefaultValues: (NSArray *)defaultValues withData:(NSArray *)data withCancelHandler:(CancelHandler)cancelHandler withDoneHandler: (MultipleAssoCiatedDoneHandler)doneHandler {
        HTMIUsefulPickerView *usefulPickerView = [HTMIUsefulPickerView new];
        
        __weak HTMIUsefulPickerView *weakUsefulPickerView = usefulPickerView;
    HTMIMultipleAssociatedPickerView *multipleAsso = [[HTMIMultipleAssociatedPickerView alloc] initWithToolBarText:toolBarText withDefaultValues:defaultValues withData:data withValueDidChangedHandler:nil cancelAction:^{
        if (cancelHandler) {
            cancelHandler();
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            [strongUsefulPickerView hidePickerView];
            
        }
        
    } doneAction:^(NSArray *selectedValues) {
        if (doneHandler) {
            doneHandler(selectedValues);
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            [strongUsefulPickerView hidePickerView];
            
        }
    }];
    
    usefulPickerView.pickerView = multipleAsso;
    [usefulPickerView showPickerView];
    return usefulPickerView;
}

+ (HTMIUsefulPickerView *)showDatePickerWithToolBarText:(NSString *)toolBarText withStyle:(HTMIDatePickerStyle *)style withCancelHandler:(CancelHandler)cancelHandler withDoneHandler: (DateDoneHandler)doneHandler {
    HTMIUsefulPickerView *usefulPickerView = [HTMIUsefulPickerView new];
    __weak HTMIUsefulPickerView *weakUsefulPickerView = usefulPickerView;

    HTMIDatePickerView *datePicker = [[HTMIDatePickerView alloc] initWithToolBarText:toolBarText withStyle:style withValueDidChangedHandler:nil cancelAction:^{
        if (cancelHandler) {
            cancelHandler();
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            [strongUsefulPickerView hidePickerView];

        }
    } doneAction:^(NSDate *selectedDate){
        if (doneHandler) {
            doneHandler(selectedDate);
        }
        __strong HTMIUsefulPickerView *strongUsefulPickerView = weakUsefulPickerView;
        if (strongUsefulPickerView) {
            [strongUsefulPickerView hidePickerView];
            
        }
    }];

    
    usefulPickerView.pickerView = datePicker;
    [usefulPickerView showPickerView];
    return usefulPickerView;
}

+ (HTMIUsefulPickerView *)showCitiesPickerWithToolBarText:(NSString *)toolBarText withDefaultSelectedValues:(NSArray *)defaultSelectedValues withCancelHandler:(CancelHandler)cancelHandler withDoneHandler:(MultipleAssoCiatedDoneHandler)doneHandler {
    
    NSString *provincePath = [[NSBundle mainBundle] pathForResource:@"Province" ofType:@"plist"];
    NSString *cityPath = [[NSBundle mainBundle] pathForResource:@"City" ofType:@"plist"];
    NSString *areaPath = [[NSBundle mainBundle] pathForResource:@"Area" ofType:@"plist"];
    
    NSArray *provinceArray = [NSArray arrayWithContentsOfFile:provincePath];
    NSDictionary *cityDic = [NSDictionary dictionaryWithContentsOfFile:cityPath];
    NSDictionary *areaDic = [NSDictionary dictionaryWithContentsOfFile:areaPath];
    
    NSArray *dataArray = @[provinceArray, cityDic, areaDic];

    
    return [HTMIUsefulPickerView showMultipleAssociatedColPickerWithToolBarText:toolBarText withDefaultValues:defaultSelectedValues withData:dataArray withCancelHandler:cancelHandler withDoneHandler:doneHandler];

}

#pragma mark - life cycle
- (instancetype)init {
    if (self = [super init]) {
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapedSelf:)];
        tapGes.numberOfTapsRequired = 1;
        [self addGestureRecognizer:tapGes];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"HTMIUsefulPickerView ===== dealloc");
}

- (void)tapedSelf:(UITapGestureRecognizer *)tap {
    CGPoint location = [tap locationInView:self];
    
    // 点击空白背景移除self
    if (location.y <= [UIScreen mainScreen].bounds.size.height - kPickerViewHeight) {
        [self hidePickerView];
    }
}

#pragma mark - helper
- (void)showPickerView {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (window) {
        /// 移除键盘第一响应者, 否则键盘始终会在界面的最上层
        [window endEditing:YES];
        /// 添加view
        [window addSubview:self];
        /// 设置pickerView的frame为屏幕底部外面 --- 动画初始位置
        self.pickerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, kPickerViewHeight);
        
        [UIView animateWithDuration:0.25f animations:^{
            self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
            /// 设置pickerView的动画结束位置, 显示在屏幕底部
            self.pickerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - kPickerViewHeight, [UIScreen mainScreen].bounds.size.width, kPickerViewHeight);;
        } completion:nil];
    }
}

- (void)hidePickerView {
    [UIView animateWithDuration:0.25f animations:^{
        self.backgroundColor = [UIColor clearColor];
        self.pickerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, kPickerViewHeight);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];

    }];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.superview) {
        self.frame = self.superview.bounds;
        self.pickerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - kPickerViewHeight, [UIScreen mainScreen].bounds.size.width, kPickerViewHeight);
        
    }
}

#pragma mark - setter getter
- (void)setPickerView:(UIView *)pickerView {
    _pickerView = pickerView;
    [self addSubview:_pickerView];
}

- (HTMIToolBar *)toolBar {
    if ([self.pickerView isKindOfClass:[HTMISinglePickerView class]]) {
        return ((HTMISinglePickerView *)self.pickerView).toolBar;
    }
    else if ([self.pickerView isKindOfClass:[HTMIMultiplePickerView class]]) {
        return ((HTMIMultiplePickerView *)self.pickerView).toolBar;
    }
    else if ([self.pickerView isKindOfClass:[HTMIMultipleAssociatedPickerView class]]) {
        return ((HTMIMultipleAssociatedPickerView *)self.pickerView).toolBar;
    }
    else if ([self.pickerView isKindOfClass:[HTMIDatePickerView class]]) {
        return ((HTMIDatePickerView *)self.pickerView).toolBar;
    }
    else {
        return [HTMIToolBar new];
    }
}
@end
