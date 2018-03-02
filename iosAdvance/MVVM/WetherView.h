//
//  WetherView.h
//  iosAdvance
//
//  Created by gw on 2018/3/2.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WetherViewModel.h"

@interface WetherView : UIView

@property (nonatomic,readwrite,strong)UILabel * locationLable;
@property (nonatomic,readwrite,strong)UILabel * dateLable;
@property (nonatomic,readwrite,strong)UILabel * wetherLable;
@property (nonatomic,readwrite,strong)UILabel * temLable;

+(instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame;

-(void)bindWetherData:(WetherViewModel *)wetherViewModel;

@end
