//
//  BlockTest.h
//  iosAdvance
//
//  Created by gw on 2018/3/13.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockTest : NSObject

+(instancetype)initInstance;
-(instancetype)initInstance;

//1、block 基本定义
-(void)baseFormat;

//2、作为c函数的参数
-(void)asCFuncPrama;
@end
