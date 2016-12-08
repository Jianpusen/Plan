//
//  JPSEditController.m
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/8.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import "JPSEditController.h"

@interface JPSEditController ()

@end

@implementation JPSEditController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 0, k_SCREEN_W - 20, k_SCREEN_H)];
    textView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:textView];
    
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
