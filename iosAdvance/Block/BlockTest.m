//
//  BlockTest.m
//  iosAdvance
//
//  Created by gw on 2018/3/13.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "BlockTest.h"

typedef int(^BaseBlock2)(int,int);

@interface BlockTest()

@property (nonatomic,copy)BaseBlock2 baseBlock2;

@end

@implementation BlockTest

+(instancetype)initInstance{
    return [[self alloc] initInstance];
}
-(instancetype)initInstance{
    if (self == [super init]) {
        
    }
    return self;
}

//1、block 基本定义
-(void)baseFormat{
    
    int (^baseBlock)(int a, int b)=^(int a,int b){
        return a + b;
    };
    int ret = baseBlock(5,7);
    
    NSLog(@"block基本格式 --%d",ret);
}

//2.c 函数添加代码块
void addFunc (int (^baseBlock3)(int a,int b)){
    
    NSLog(@"1往c函数添加block参数--%d",baseBlock3(300,200));
}
//2、作为c函数的参数
-(void)asCFuncPrama{
    
    int (^baseBlock3)(int a,int b) = ^(int a,int b){
        
        NSLog(@"2往c函数添加block参数%@",[NSThread currentThread]);
        return a+b;
    };
    NSLog(@"3往c函数添加block参数");
   addFunc(baseBlock3);
    NSLog(@"4往c函数添加block参数");
}



@end
