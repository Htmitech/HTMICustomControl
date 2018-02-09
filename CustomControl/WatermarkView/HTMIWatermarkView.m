//
//  HTMIWatermarkView.m
//  MXClient
//
//  Created by wlq on 2017/4/12.
//  Copyright © 2017年 MXClient. All rights reserved.
//

#import "HTMIWatermarkView.h"

#import "HTMIUserdefaultHelper.h"

#import <math.h>

#import "UIFont+HTMIFont.h"

@interface HTMIWatermarkView()
{
    CGFloat _rowHeight;
}

@property (nonatomic,assign,readwrite) NSInteger column;

@property (nonatomic,assign,readwrite) NSInteger row;

@property (nonatomic,assign,readwrite) CGFloat verticalSpace;

@property (nonatomic,assign,readwrite) CGFloat myFont;

@property (nonatomic,assign,readwrite) CGFloat horizontalSpace;

@property (nonatomic,assign,readwrite) CGFloat itemWidth;

@property (nonatomic,strong,readwrite) UIColor * myBackgroundColor;

@property (nonatomic,strong,readwrite)NSString * content;

@end

@implementation HTMIWatermarkView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self defaultSet];
    }
    return self;
}

- (void)setTextFontColor:(UIColor *)textFontColor{
    
    for (UILabel *nameLabel in self.subviews) {
        if ([nameLabel isMemberOfClass:[UILabel class]]) {
            nameLabel.textColor = textFontColor;//RGBA(238, 238, 238, 1);
        }
    }
}

- (void)setMyBackgroundColor:(UIColor *)myBackgroundColor{
    _myBackgroundColor = myBackgroundColor;
    
    self.backgroundColor = myBackgroundColor;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defaultSet];
        self.backgroundColor = _myBackgroundColor;
        self.clipsToBounds = YES;
        
        [self setUpView];
    }
    return self;
}

- (void)defaultSet{
    
    _myFont = 24.0;
    _content = [[HTMIUserdefaultHelper defaultLoadContext] objectForKey:@"UserName"];
    _itemWidth = [_content sizeWithAttributes:@{NSFontAttributeName:[UIFont mySystemFontOfSize:_myFont]}].width;
    _column = floor(self.frame.size.width/(_itemWidth + _horizontalSpace)); //2;//默认两列
    _rowHeight = [_content sizeWithAttributes:@{NSFontAttributeName:[UIFont mySystemFontOfSize:_myFont]}].height;
    
    _verticalSpace = 80;
    _horizontalSpace = 50;
    
    _myBackgroundColor = [UIColor whiteColor];
    
}

- (void)drawRect:(CGRect)rect{
    
    
}

- (void)setUpView{
    //获取行数
    _row = [self caculateRows];
    CGFloat firstColumSapce = 0;
    for (int column = 0; column <= _column; column++) {
        
        for (int row = 0; row <= _row; row++) {
            
            if (column == 0) {
                firstColumSapce = _horizontalSpace;
            }
            
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(column* (_itemWidth + _horizontalSpace) + firstColumSapce, row *(_rowHeight + _verticalSpace), _itemWidth, _rowHeight)];
            
            [self  setLabelAttribute:nameLabel];
            if (column == 0) {
                nameLabel.text = _content;
            }
            else{
                nameLabel.text = _content;
            }
            
            [self addSubview:nameLabel];
        }
    }
}

- (void)setLabelAttribute:(UILabel *)nameLabel{
    
    nameLabel.transform = CGAffineTransformMakeRotation(-M_PI_4);
    nameLabel.font = [UIFont mySystemFontOfSize:_myFont];//不跟随平台变化
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.textColor = [UIColor lightGrayColor];//RGBA(238, 238, 238, 1);
}

- (void)setColumn:(NSInteger)column{
    _column = column;
}

- (NSInteger)caculateRows{
    
    CGFloat height = self.frame.size.height;
    NSInteger rowCount = floor(height/(_rowHeight + _verticalSpace));
    return rowCount;
}

@end
