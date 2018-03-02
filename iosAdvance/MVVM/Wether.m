//
//  Wether.m
//  iosAdvance
//
//  Created by gw on 2018/3/2.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "Wether.h"

@implementation Wether
+(instancetype)initWithDictionary:(NSDictionary *)dic{
    return [[self alloc] initWithDictionary:dic];
}
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    if (self == [super init]) {
        
        self.location = dic[@"location"];
        self.date = dic[@"date"];
        self.wetherType = dic[@"wetherType"];
        self.temperature = dic[@"temperature"];
    }
    return self;
}

@end
