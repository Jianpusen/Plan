//
//  JPSNotepadController.m
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/8.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import "JPSNotepadController.h"
#import "JPSNotepadCell.h"
#import "JPSEditController.h"
@interface JPSNotepadController ()

@end

@implementation JPSNotepadController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.titleStr;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    JPSNotepadCell *cell = (JPSNotepadCell *)[tableView dequeueReusableCellWithIdentifier:@"JPSNotepadCellIdentifier"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([JPSNotepadCell class]) owner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    return cell;

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JPSEditController *editContrl = [[JPSEditController alloc] init];
    [self.navigationController pushViewController:editContrl animated:YES];

}
@end
