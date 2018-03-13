//
//  ViewController.m
//  iosAdvance
//
//  Created by gw on 2018/2/27.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "BlockTest.h"
@interface ViewController ()

@end


extern NSString  * name;

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [[BlockTest initInstance] asCFuncPrama];
}

@end
