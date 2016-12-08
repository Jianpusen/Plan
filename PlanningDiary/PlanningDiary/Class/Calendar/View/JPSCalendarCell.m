//
//  JPSCalendarCell.m
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/8.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import "JPSCalendarCell.h"
@interface JPSCalendarCell()
@property (nonatomic, strong) UIView *cellView;
@property (nonatomic, strong) UILabel *dateLabel;//日期日历

@end
@implementation JPSCalendarCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupCell];
    }
    return self;
}
- (void)setupCell{
    
    //总的view
    self.cellView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:self.cellView];
    
    //日期
    self.dateLabel = [[UILabel alloc] initWithFrame:self.cellView.bounds];
    [self.dateLabel setTextAlignment:NSTextAlignmentCenter];
    [self.dateLabel setFont:[UIFont systemFontOfSize:20]];
    [self.cellView addSubview:self.dateLabel];
    
}
- (void)setModel:(CalendarModel *)model{
    _model = model;
    self.dateLabel.text = model.dateStr;
    self.dateLabel.textColor = model.strColor;
    if (model.isBorder) {
        self.cellView.layer.borderWidth = 1;
        self.cellView.layer.borderColor = [UIColor grayColor].CGColor;
    }else{
        self.cellView.layer.borderWidth = 0;
    }
}
@end
