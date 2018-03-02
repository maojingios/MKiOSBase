//
//  WetherViewModel.h
//  iosAdvance
//
//  Created by gw on 2018/3/2.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Wether.h"
@interface WetherViewModel : NSObject

@property (nonatomic,readwrite,copy)NSString * location;
@property (nonatomic,readwrite,copy)NSString * date;
@property (nonatomic,readwrite,copy)NSString * wetherType;
@property (nonatomic,readwrite,copy)NSString * temperature;

+(instancetype)initViewModelWithWether:(Wether *)wether;
-(instancetype)initViewModelWithWether:(Wether *)wether;

@end
