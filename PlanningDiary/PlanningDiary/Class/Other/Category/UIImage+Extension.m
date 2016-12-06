//
//  UIImage+Extension.m
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/6.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)imageWithFileName:(NSString *)name{
    
    if ([name hasSuffix:@".png"]) {
        name = [name substringWithRange:NSMakeRange(0, name.length - 4)];
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:@"png"];
    return [UIImage imageWithContentsOfFile:path];
}
@end
