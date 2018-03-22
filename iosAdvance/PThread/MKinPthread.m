//
//  MKinPthread.m
//  MKinBase
//
//  Created by maojing on 2018/3/20.
//  Copyright © 2018年 maojing. All rights reserved.
//

#import "MKinPthread.h"
#import <pthread.h>

@implementation MKinPthread
+(instancetype)initInstance{
    return [[self alloc] init];
}
-(instancetype)init{
    if (self =[super init]) {
        
    }
    return self;
}
/*
 返回值是任意类型，函数名demo，参数也是任意类型。
 */
void * demo(void * param){
    
    NSLog(@"当前线程：%@ /n传递的参数：%@",[NSThread currentThread],param);
    return NULL;
}

-(void)pthreadDemo{
    
    /*
     1、指向线程代号的指针
     2、线程的属性
     3、指向函数的指针（例如上面定义的demo函数，该函数的地址取法：&demo）
     4、传递给该函数的参数
     
     void *    (*)     (void *)
     返回值  （函数指针）  （参数）
     
     void * 和oc 中的id是等价，即任意类型。
     
     该函数的返回值：0代表成功；非0代表错误。
     
     */
    
    /*
     桥接：
     在ARC开发中，如果涉及到和C语言中的相同数据类型进行转换，则需要使用桥接__bridge;
     (在OC中，自动内存管理机制只负责OC数据类型的内存管理，至于C的数据，就需要通过__bridge告诉系统，我这有C的数据类型，你也帮我管理下吧，然后OC系统说，好的！)
     
     但在MRC中，我们自己管理内存，因此不用写__bridge
     
     */
    
    pthread_t threadid ;
    NSString * string = @"mao jing";
    int result = pthread_create(&threadid, NULL, &demo, (__bridge void *)(string));
    
    if (result == 0) {
        NSLog(@"成功");
    }else{
        NSLog(@"失败");
    }
    
    //3.设置子线程的状态设置为detached,则该线程运行结束后会自动释放所有资源，或者在子线程中添加 pthread_detach(pthread_self()),其中pthread_self()是获得线程自身的id
    pthread_detach(threadid);
    
}

/*
 其他相关函数
 
 pthread_t：线程ID
 pthread_attr_t：线程属性
 pthread_create()：创建一个线程
 pthread_exit()：终止当前线程
 pthread_cancel()：中断另外一个线程的运行
 pthread_join()：阻塞当前的线程，直到另外一个线程运行结束
 pthread_attr_init()：初始化线程的属性
 pthread_attr_setdetachstate()：设置脱离状态的属性（决定这个线程在终止时是否可以被结合）
 pthread_attr_getdetachstate()：获取脱离状态的属性
 pthread_attr_destroy()：删除线程的属性
 pthread_kill()：向线程发送一个信号
 pthread_equal(): 对两个线程的线程标识号进行比较
 pthread_detach(): 分离线程
 pthread_self(): 查询线程自身线程标识号
 */
@end
