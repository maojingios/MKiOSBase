//
//  OperationFactory.m
//  iosAdvance
//
//  Created by gw on 2018/3/1.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "OperationFactory.h"

@implementation OperationFactory

+(Operation *)createOperationWithType:(NSString *)type{
    
    return [NSClassFromString(type) new];
}

@end
