//
//  CalendarModel.h
//  SZCalendarPicker
//
//  Created by 庄鹏泽 on 16/12/7.
//  Copyright © 2016年 Stephen Zhuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CalendarModel : NSObject

@property (nonatomic, strong)  NSString *dateStr;//日期
@property (nonatomic, strong) UIColor *strColor;//字体颜色
@property (nonatomic, assign) BOOL isBorder;//是否需要边框
@property (nonatomic, assign) NSInteger tipNum;//消息提示数量
@end
