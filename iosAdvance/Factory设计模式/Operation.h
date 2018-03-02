//
//  Operation.h
//  iosAdvance
//
//  Created by gw on 2018/3/1.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Operation : NSObject
@property (nonatomic,readwrite,assign)NSInteger  numOne;
@property (nonatomic,readwrite,assign)NSInteger  numTwo;
-(NSInteger)getResult;

@end
