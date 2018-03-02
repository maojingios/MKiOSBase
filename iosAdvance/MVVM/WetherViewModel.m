//
//  WetherViewModel.m
//  iosAdvance
//
//  Created by gw on 2018/3/2.
//  Copyright © 2018年 MKin. All rights reserved.
//

/*@property (nonatomic,readwrite,copy)NSString * location;
 @property (nonatomic,readwrite,copy)NSString * date;
 @property (nonatomic,readwrite,copy)NSString * wetherType;
 @property (nonatomic,readwrite,copy)NSString * temperature;*/

#import "WetherViewModel.h"

@implementation WetherViewModel

+(instancetype)initViewModelWithWether:(Wether *)wether{
    return [[self alloc] initViewModelWithWether:wether];
}

-(instancetype)initViewModelWithWether:(Wether *)wether{
    if (self == [super init]) {
        
        self.location = wether.location;
        self.date = wether.date;
        self.wetherType = wether.wetherType;
        self.temperature = wether.temperature;
    }
    return self;
}


@end
