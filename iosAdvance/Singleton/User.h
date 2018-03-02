//
//  User.h
//  iosAdvance
//
//  Created by gw on 2018/2/27.
//  Copyright © 2018年 MKin. All rights reserved.
//
#import "MKSingleton.h"
#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface User : NSObject
@property (nonatomic,readwrite,strong)NSString * kName;
singleH(User);

-(void)printName;


@end
