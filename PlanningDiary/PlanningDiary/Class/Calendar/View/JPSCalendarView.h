//
//  JPSCalendarView.h
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/8.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPSCalendarView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong) NSDate *date;
@property (nonatomic , strong) NSDate *today;
@property (nonatomic, copy) void(^calendarBlock)(NSInteger day, NSInteger month, NSInteger year);

+ (instancetype)showOnView:(UIView *)view;


@end
