//
//  MKGCD.h
//  iosAdvance
//
//  Created by gw on 2018/3/5.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MKGCD : NSObject

@property (nonatomic,readwrite,assign)NSInteger ticketsNumber;
@property (nonatomic,readwrite,strong)dispatch_semaphore_t mkSemaphore;

+(instancetype)initInstance;
-(instancetype)initInstance;

//1、同步执行+并发队列
-(void)syncConcurrent;

//2、异步执行+并发队列
-(void)asyncConcurrent;

//3、同步执行+串行队列
-(void)syncSerial;

//4、异步执行+并发队列
-(void)asyncSerial;

//5、栅栏
-(void)barrier;

//6、延迟
-(void)after;

//7、一次性代码
-(void)once;

//8、快速迭代
-(void)apply;

//9、队列组-(监听线程组)
-(void)groupNotify;

//10、队列组-（wait）
-(void)groupWait;

//11、队列组-（enter leave）
-(void)groupEnterLeave;

//12、线程同步
-(void)semaphore;
-(void)controlQueue;

//13、semaphore加锁，购买火车票
-(void)semaphoreUnLock;
-(void)semaphoreLock;

@end
