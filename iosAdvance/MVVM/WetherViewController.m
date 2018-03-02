//
//  WetherViewController.m
//  iosAdvance
//
//  Created by gw on 2018/3/2.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "WetherViewController.h"


@interface WetherViewController ()
{
    WetherView * _wView;
}
@end

@implementation WetherViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self setUpUI];
    
    [self netWork];
}
-(void)setUpUI{
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _wView = [[WetherView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_wView];
    
}

-(void)netWork{
    
    //网络请求得到数据
    
    NSDictionary * dic = @{@"location":@"广州",
                           @"date":@"2018-03-02",
                           @"wetherType":@"阴天",
                           @"temperature":@"23度"
                           };
    
    Wether * wModel = [Wether initWithDictionary:dic];
    WetherViewModel * wvvModel = [WetherViewModel initViewModelWithWether:wModel];
    [_wView bindWetherData:wvvModel];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
