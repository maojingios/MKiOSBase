//
//  Wether.h
//  iosAdvance
//
//  Created by gw on 2018/3/2.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wether : NSObject

@property (nonatomic,readwrite,copy)NSString * location;
@property (nonatomic,readwrite,copy)NSString * date;
@property (nonatomic,readwrite,copy)NSString * wetherType;
@property (nonatomic,readwrite,copy)NSString * temperature;

+(instancetype)initWithDictionary:(NSDictionary *)dic;
-(instancetype)initWithDictionary:(NSDictionary *)dic;

@end
