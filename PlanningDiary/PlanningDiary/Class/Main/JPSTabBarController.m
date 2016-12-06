//
//  JPSTabBarController.m
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/6.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import "JPSTabBarController.h"
#import "JPSTodayController.h"
#import "JPSCalendarController.h"
#import "JPSNavigationController.h"
@interface JPSTabBarController ()

@end

@implementation JPSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JPSCalendarController *caldenContrl = [[JPSCalendarController alloc] init];
    [self addChildVc:caldenContrl title:@"日历" image:@"tabbar_nearby_btn_n" selectedImg:@"tabbar_nearby_btn_s"];
    
    
    JPSTodayController *todayContrl = [[JPSTodayController alloc] init];
    [self addChildVc:todayContrl title:@"今天" image:@"tabbar_mine_icon_n" selectedImg:@"tabbar_mine_icon_s"];
    
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImg:(NSString *)selectImg{
    

    
    //设置标题
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];

    //需要设置照片的模式
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //创建修改字体颜色的字典，同时可以设置字体的内边距
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
   
    JPSNavigationController *nav= [[JPSNavigationController alloc] initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
