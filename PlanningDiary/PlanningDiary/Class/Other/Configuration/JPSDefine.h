//
//  JPSDefine.h
//  PlanningDiary
//
//  Created by 庄鹏泽 on 16/12/6.
//  Copyright © 2016年 庄鹏泽. All rights reserved.
//

#ifndef JPSDefine_h
#define JPSDefine_h


/** 主屏幕的高度 */
#define k_SCREEN_H [[UIScreen mainScreen] bounds].size.height
/** 主屏幕的宽度 */
#define k_SCREEN_W  [[UIScreen mainScreen] bounds].size.width

/** 颜色(RGB) */
#define k_RGB(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define k_RGBA(r,g,b,a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#endif /* JPSDefine_h */
