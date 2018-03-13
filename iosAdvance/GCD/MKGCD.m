//
//  MKGCD.m
//  iosAdvance
//
//  Created by gw on 2018/3/5.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "MKGCD.h"

@implementation MKGCD

+(instancetype)initInstance{
    return [[self alloc] initInstance];
}
-(instancetype)initInstance{
    if (self == [super init]) {
        
    }
    return self;
}
/***************************GCD的基本使用*********************************/

//1、同步执行+并发
-(void)syncConcurrent{
    
    //并发
    dispatch_queue_t queue = dispatch_queue_create("mkQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //同步
    dispatch_sync(queue, ^{
        NSLog(@"任务1--并发+同步--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2--并发+同步--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3--并发+同步--%@",[NSThread currentThread]);
    });
}


//2、异步执行+并发
-(void)asyncConcurrent{
    
    //并发
    dispatch_queue_t queue = dispatch_queue_create("mkQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //异步
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务1--并发+异步--%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务2--并发+异步--%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务3--并发+异步--%@",[NSThread currentThread]);
        }
    });
}
//3、同步执行+串行队列
-(void)syncSerial{
    
    //队列
    dispatch_queue_t queue = dispatch_queue_create("mkQueue", DISPATCH_QUEUE_SERIAL);
    
    //执行
    dispatch_sync(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务1--串行队列+同步执行--%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务2--串行队列+同步执行--%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务3--串行队列+同步执行--%@",[NSThread currentThread]);
        }
    });
}

//4、异步执行+串行队列
-(void)asyncSerial{
    
    //串行队列
    dispatch_queue_t queue = dispatch_queue_create("mkQueue", DISPATCH_QUEUE_SERIAL);
    
    //异步执行
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务1--串行队列+异步执行--%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务2--串行队列+异步执行--%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务3--串行队列+异步执行--%@",[NSThread currentThread]);
        }
    });
}

/***************************GCD线程间的通信*********************************/
/***************************GCD栅栏*********************************/
/*我们有时需要异步执行两组操作，而且第一组操作执行完之后，才能开始执行第二组操作。这样我们就需要一个相当于栅栏一样的一个方法将两组异步执行的操作组给分割起来，当然这里的操作组里可以包含一个或多个任务。这就需要用到dispatch_barrier_async方法在两个操作组间形成栅栏。
 dispatch_barrier_async函数会等待前边追加到并发队列中的任务全部执行完毕之后，再将指定的任务追加到该异步队列中。然后在dispatch_barrier_async函数追加的任务执行完毕之后，异步队列才恢复为一般动作，接着追加任务到该异步队列并开始执行。
*/
//5、栅栏
-(void)barrier{
    
    //并发队列
    dispatch_queue_t queue = dispatch_queue_create("mkQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务1--串行队列+异步执行--%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务2--串行队列+异步执行--%@",[NSThread currentThread]);
        }
    });
    dispatch_barrier_sync(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"栅栏--%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务3--串行队列+异步执行--%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务4--串行队列+异步执行--%@",[NSThread currentThread]);
        }
    });
}
/***************************延迟*********************************/
/*dispatch_after函数并不是在指定时间之后才开始执行处理，而是在指定时间之后将任务追加到主队列中。严格来说，这个时间并不是绝对准确的，但想要大致延迟执行任务，dispatch_after函数是很有效的*/
-(void)after{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"延迟执行的任务");
    });    
}
/***************************一次性代码*********************************/
/*我们在创建单例、或者有整个程序运行过程中只执行一次的代码时，我们就用到了 GCD 的 dispatch_once 函数。使用
 dispatch_once 函数能保证某段代码在程序运行过程中只被执行1次，并且即使在多线程的环境下，dispatch_once也可以保证线程安全。*/

-(void)once{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //code here;
    });
}

/***************************快速迭代*********************************/
/*通常我们会用 for 循环遍历，但是 GCD 给我们提供了快速迭代的函数dispatch_apply。dispatch_apply按照指定的次数将指定的任务追加到指定的队列中，并等待全部队列执行结束。
 我们可以利用异步队列同时遍历。比如说遍历 0~5 这6个数字，for 循环的做法是每次取出一个元素，逐个遍历。dispatch_apply可以同时遍历多个数字。
*/
-(void)apply{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_apply(10, queue, ^(size_t index) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"apply--%ld-%@",index,[NSThread currentThread]);
    });
}
/***************************队列组*********************************/
/*有时候我们会有这样的需求：分别异步执行2个耗时任务，然后当2个耗时任务都执行完毕后再回到主线程执行任务。这时候我们可以用到 GCD 的队列组。
 
 调用队列组的 dispatch_group_async 先把任务放到队列中，然后将队列放入队列组中。或者使用队列组的 dispatch_group_enter、dispatch_group_leave 组合 来实现
 dispatch_group_async。
 调用队列组的 dispatch_group_notify 回到指定线程执行任务。或者使用 dispatch_group_wait 回到当前线程继续向下执行（会阻塞当前线程）
*/
//9、队列组
-(void)groupNotify{
    
    //队列组
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务1--队列组--%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务2--队列组--%@",[NSThread currentThread]);
        }
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务3--队列组--%@",[NSThread currentThread]);
        }
    });
    NSLog(@"监听到队列组完成任务，回到主线程");
}

/***************************队列组*********************************/
/*dispatch_group_wait 会阻塞当前线程。*/

-(void)groupWait{
    
    //队列组
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务1--队列组--%@",[NSThread currentThread]);
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务2--队列组--%@",[NSThread currentThread]);
        }
    });
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"监听到队列组完成任务，回到主线程");
}
/*2018-03-05 13:57:11.854188 iosAdvance[2854:655528] 任务1--队列组--<NSThread: 0x170073580>{number = 3, name = (null)}
 2018-03-05 13:57:11.854672 iosAdvance[2854:655525] 任务2--队列组--<NSThread: 0x17007ac00>{number = 4, name = (null)}
 2018-03-05 13:57:12.859906 iosAdvance[2854:655528] 任务1--队列组--<NSThread: 0x170073580>{number = 3, name = (null)}
 2018-03-05 13:57:12.860315 iosAdvance[2854:655525] 任务2--队列组--<NSThread: 0x17007ac00>{number = 4, name = (null)}
 2018-03-05 13:57:13.865762 iosAdvance[2854:655528] 任务1--队列组--<NSThread: 0x170073580>{number = 3, name = (null)}
 2018-03-05 13:57:13.866220 iosAdvance[2854:655525] 任务2--队列组--<NSThread: 0x17007ac00>{number = 4, name = (null)}
 2018-03-05 13:57:13.866451 iosAdvance[2854:655505] 监听到队列组完成任务，回到主线程*/


/***************************队列组--enter-leave*********************************/
/*dispatch_group_enter 标志着一个任务追加到 group，执行一次，相当于 group 中未执行完毕任务数+1
 dispatch_group_leave 标志着一个任务离开了 group，执行一次，相当于 group 中未执行完毕任务数-1。
 当 group 中未执行完毕任务数为0的时候，才会使dispatch_group_wait解除阻塞，以及执行追加到dispatch_group_notify中的任务。
*/
-(void)groupEnterLeave{
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务1--队列组--%@",[NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"任务2--队列组--%@",[NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
//    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//        NSLog(@"队列组任务已经执行完毕，回到主线程");
//    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"---end---");
}
/*
 //notify
 2018-03-05 14:12:20.665549 iosAdvance[2864:657616] ---end---
 2018-03-05 14:12:21.677684 iosAdvance[2864:657635] 任务1--队列组--<NSThread: 0x170071d00>{number = 3, name = (null)}
 2018-03-05 14:12:21.678169 iosAdvance[2864:657671] 任务2--队列组--<NSThread: 0x170071840>{number = 4, name = (null)}
 2018-03-05 14:12:22.680996 iosAdvance[2864:657635] 任务1--队列组--<NSThread: 0x170071d00>{number = 3, name = (null)}
 2018-03-05 14:12:22.681403 iosAdvance[2864:657671] 任务2--队列组--<NSThread: 0x170071840>{number = 4, name = (null)}
 2018-03-05 14:12:23.686703 iosAdvance[2864:657635] 任务1--队列组--<NSThread: 0x170071d00>{number = 3, name = (null)}
 2018-03-05 14:12:23.687214 iosAdvance[2864:657671] 任务2--队列组--<NSThread: 0x170071840>{number = 4, name = (null)}
 2018-03-05 14:12:23.687500 iosAdvance[2864:657616] 队列组任务已经执行完毕，回到主线程
 
 //wait
 2018-03-05 14:13:31.303875 iosAdvance[2866:657971] 任务1--队列组--<NSThread: 0x1702749c0>{number = 3, name = (null)}
 2018-03-05 14:13:31.304432 iosAdvance[2866:658007] 任务2--队列组--<NSThread: 0x170268880>{number = 4, name = (null)}
 2018-03-05 14:13:32.309640 iosAdvance[2866:657971] 任务1--队列组--<NSThread: 0x1702749c0>{number = 3, name = (null)}
 2018-03-05 14:13:32.310073 iosAdvance[2866:658007] 任务2--队列组--<NSThread: 0x170268880>{number = 4, name = (null)}
 2018-03-05 14:13:33.311536 iosAdvance[2866:657971] 任务1--队列组--<NSThread: 0x1702749c0>{number = 3, name = (null)}
 2018-03-05 14:13:33.311672 iosAdvance[2866:658007] 任务2--队列组--<NSThread: 0x170268880>{number = 4, name = (null)}
 2018-03-05 14:13:33.311802 iosAdvance[2866:657951] ---end---
 */

/***************************信号量*********************************/

-(void)semaphore{
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(queue, ^{
        
        [NSThread sleepForTimeInterval:1.0];
        
        NSLog(@"1");
        
        dispatch_semaphore_signal(semaphore);
    });
    
    NSLog(@"2");
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER); //当信号量为0时，会堵塞当前线程，大于0时，会继续向下执行。
    
    NSLog(@"3");
}

/*2018-03-05 15:41:50.105965 iosAdvance[2915:669387] 2
 2018-03-05 15:41:51.111484 iosAdvance[2915:669411] 1
 2018-03-05 15:41:51.111820 iosAdvance[2915:669387] 3*/

-(void)controlQueue{
    
    //crate的value表示，最多几个资源可访问
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(2);
    
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //任务1
    NSLog(@"任务1");
    dispatch_async(quene, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"1---%@",semaphore);
        sleep(1);
        dispatch_semaphore_signal(semaphore);
        NSLog(@"2---%@",semaphore);
    });
    //任务2
    NSLog(@"任务2");
    dispatch_async(quene, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"3---%@",semaphore);
        sleep(1);
        dispatch_semaphore_signal(semaphore);
        NSLog(@"4---%@",semaphore);
    });
    //任务3
    NSLog(@"任务3");
    dispatch_async(quene, ^{
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"5---%@",semaphore);
        sleep(1);
        dispatch_semaphore_signal(semaphore);
        NSLog(@"6---%@",semaphore);
    });
    
    NSLog(@"7---end");
}

/****************************semaphore加锁--前（为加锁）********************************/

-(void)semaphoreUnLock{
    
    //初始化
    self.ticketsNumber = 50;
    
    //广州售票中心
    dispatch_queue_t guangZhou = dispatch_queue_create("guangZhouSaleCenter", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(guangZhou, ^{
        
        [self ksellTickets];
    });
    
    //北京售票中心
    dispatch_queue_t beiJing = dispatch_queue_create("beiJingSaleCenter", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(beiJing, ^{
        
        [self ksellTickets];
    });
}

-(void)ksellTickets{
    
    while (1) {
        if (self.ticketsNumber>0) {
            self.ticketsNumber --;
            NSLog(@"LESS-%@-%ld",[NSThread currentThread],self.ticketsNumber);
        }
    }
}
/****************************semaphore加锁（加锁）********************************/

-(void)semaphoreLock{
    
    //初始化
    self.ticketsNumber = 50;
    
    self.mkSemaphore = dispatch_semaphore_create(1);
    
    //广州售票中心
    dispatch_queue_t guangZhou = dispatch_queue_create("guangZhouSaleCenter", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(guangZhou, ^{
        
        [self sellTickets];
    });
    
    //北京售票中心
    dispatch_queue_t beiJing = dispatch_queue_create("beiJingSaleCenter", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(beiJing, ^{
        
        [self sellTickets];
    });
    
}

-(void)sellTickets{
    
    while (1) {
        
        //(代码走到这里，信号量变成一，当前线程将停在这里，知道下面将信号量加一，否则其它线程不可能调用卖票逻辑，从而达到线程保护作用)；
        dispatch_semaphore_wait(self.mkSemaphore, DISPATCH_TIME_FOREVER);//加锁
        
        if (self.ticketsNumber>0) {
            self.ticketsNumber --;
            NSLog(@"LESS-%@-%ld",[NSThread currentThread],self.ticketsNumber);
        }else{
            NSLog(@"票已经卖完了！");
            break;
        }
        
        dispatch_semaphore_signal(self.mkSemaphore);//解锁
    }
}

@end
