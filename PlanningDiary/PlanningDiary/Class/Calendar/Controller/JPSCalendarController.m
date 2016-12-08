//
//  JPSCalendarController.m
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/6.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import "JPSCalendarController.h"
#import "JPSCalendarView.h"
#import "JPSNotepadController.h"
@interface JPSCalendarController ()

@end

@implementation JPSCalendarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"日历";
    
    [self setupCalendarView];
   
}
- (void)setupCalendarView{
    
    JPSCalendarView *calendarPicker = [JPSCalendarView showOnView:self.view];
    calendarPicker.today = [NSDate date];
    calendarPicker.date = calendarPicker.today;
    calendarPicker.frame = CGRectMake(0, 64, k_SCREEN_W, k_SCREEN_W+50);
    calendarPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
        
        NSLog(@"%zd-%zd-%zd", year,month,day);
        JPSNotepadController *noteContrl = [[JPSNotepadController alloc] init];
        noteContrl.titleStr = [NSString stringWithFormat:@"%zd-%zd-%zd",year,month,day];
        [self.navigationController pushViewController:noteContrl animated:YES];
    
    };
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
