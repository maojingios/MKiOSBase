//
//  WetherView.m
//  iosAdvance
//
//  Created by gw on 2018/3/2.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "WetherView.h"

@implementation WetherView

+(instancetype)initWithFrame:(CGRect)frame{
    return [[self alloc] initWithFrame:frame];
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self ==[super initWithFrame:frame]) {
        
        [self setUpUI];
        
    }
    return self;
}

-(void)bindWetherData:(WetherViewModel *)wetherViewModel{
    
    self.locationLable.text = wetherViewModel.location;
    self.dateLable.text = wetherViewModel.date;
    self.wetherLable.text = wetherViewModel.wetherType;
    self.temLable.text = wetherViewModel.temperature;
}

-(void)setUpUI{
    
    self.locationLable = [[UILabel alloc] init];
    self.locationLable.text = @"地址";
    self.locationLable.frame = CGRectMake(100, 100, 100, 45);
    [self addSubview:self.locationLable];
    
    self.dateLable = [[UILabel alloc] init];
    self.dateLable.text = @"日期";
    self.dateLable.frame = CGRectMake(100, 150, 100, 45);
    [self addSubview:self.dateLable];
    
    self.wetherLable = [[UILabel alloc] init];
    self.wetherLable.text = @"天气";
    self.wetherLable.frame = CGRectMake(100, 200, 100, 45);
    [self addSubview:self.wetherLable];
    
    self.temLable = [[UILabel alloc] init];
    self.temLable.text = @"温度";
    self.temLable.frame = CGRectMake(100, 250, 100, 45);
    [self addSubview:self.temLable];
}

@end
