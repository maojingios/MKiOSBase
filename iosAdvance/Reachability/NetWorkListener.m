//
//  NetWorkListener.m
//  iosAdvance
//
//  Created by gw on 2018/3/13.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "NetWorkListener.h"
#import "Reachability.h"

@interface NetWorkListener()

@property (nonatomic,strong)Reachability * hostReachability;
@property (nonatomic,strong)Reachability * defaultReachability;

@end

@implementation NetWorkListener

/**********************singleton***********************/
static NetWorkListener * _manager;
+(__kindof NetWorkListener * )manager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [super allocWithZone:NULL];
    });
    return _manager;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return [NetWorkListener manager];
}
-(instancetype)copyWithZone:(struct _NSZone *)zone{
    return [NetWorkListener manager];
}

/**********************method***********************/

/*add listener*/
-(void)addNetWorkListener{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(netWorkChange:) name:kReachabilityChangedNotification object:nil];
    
    //1.检测制定服务器是否可以到达
    self.hostReachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [self.hostReachability startNotifier];
    
    //2.检测默认路由是否可以到达
    self.defaultReachability = [Reachability reachabilityForInternetConnection];
    [self.defaultReachability startNotifier];
}

/* receive notification*/
-(void)netWorkChange:(NSNotification *)obj{
    
    Reachability * receiveReachability = [obj object];
    if ([receiveReachability isKindOfClass:[Reachability class]]){
        
        NetworkStatus status = [receiveReachability currentReachabilityStatus];
        switch (status) {
            case ReachableViaWiFi:
                NSLog(@"当前网络为-WiFi");
                break;
            case ReachableViaWWAN:
                NSLog(@"当前网络为-移动网络");
                break;
            case NotReachable:
                NSLog(@"当前网络为-没有网络");
                break;
            default:
                break;
        }
    }
}
@end
