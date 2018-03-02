//
//  OperationFactory.h
//  iosAdvance
//
//  Created by gw on 2018/3/1.
//  Copyright © 2018年 MKin. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "Operation.h"
@interface OperationFactory : NSObject

+(Operation *)createOperationWithType:(NSString *)type;
@end
