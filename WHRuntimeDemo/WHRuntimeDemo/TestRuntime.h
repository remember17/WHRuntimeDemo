//
//  TestRuntime.h
//  WHRuntimeDemo
//  https://github.com/remember17/WHRuntimeDemo
//  Created by 吴浩 on 2017/6/20.
//  Copyright © 2017年 wuhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestRuntime : NSObject

@property (nonatomic, copy) NSString *publicProperty;

- (void)publicMethod;
+ (void)classMethod;

@end
