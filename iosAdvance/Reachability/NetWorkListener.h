//
//  NetWorkListener.h
//  iosAdvance
//
//  Created by gw on 2018/3/13.
//  Copyright © 2018年 MKin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkListener : NSObject
+(__kindof NetWorkListener * )manager;

/*add listener*/
-(void)addNetWorkListener;


@end
