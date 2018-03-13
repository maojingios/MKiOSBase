//
//  Calculations.h
//  iosAdvance
//
//  Created by gw on 2018/3/7.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculations : NSObject

@property (nonatomic,readwrite,strong)NSMutableArray * sourceArr;

+(instancetype)initInstance;
-(instancetype)initInstance;

//快速排序
+ (void)quickSort:(NSMutableArray *)array low:(int)low high:(int)high;

//冒泡排序
+ (void)buddleSort:(NSMutableArray *)array;

//选择排序
+ (void)selectSort:(NSMutableArray *)array;

//插入排序
+ (void)inserSort:(NSMutableArray *)array;

//打印数组
+ (void)printArray:(NSArray *)array;


@end
