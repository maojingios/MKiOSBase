//
//  User.m
//  iosAdvance
//
//  Created by gw on 2018/2/27.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "User.h"

extern NSString * const name = @"hello";

@implementation User
singleM(User);

-(void)printName{
    
    NSLog(@"%@",[User shareUser].kName);
}

@end
