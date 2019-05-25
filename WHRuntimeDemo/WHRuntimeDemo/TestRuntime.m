//
//  TestRuntime.m
//  WHRuntimeDemo
//  https://github.com/remember17/WHRuntimeDemo
//  Created by 吴浩 on 2017/6/20.
//  Copyright © 2017年 wuhao. All rights reserved.
//

#import "TestRuntime.h"
#import "NSObject+WHRuntime.h"
#import <objc/runtime.h>

@interface TestRuntime () <NSFileManagerDelegate>

@property (nonatomic, strong) NSDictionary *privateProperty;

@end

@implementation TestRuntime {
    NSArray *_variableA;
    NSInteger _variableB;
}

+ (void)classMethod {
    
}

- (void)publicMethod {
    
}

- (void)privateMethod {
    NSLog(@"我是一个私有方法，可是你却用runtime调用了我！\n\n\n");
}


/** 消息转发 没有找到SEL时会执行 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    // 如果方法名是wh_addMethod，就添加一个MethodOne方法来执行
    if (sel == NSSelectorFromString(@"wh_addMethod")) {
        class_addMethod(self, sel, (IMP)MethodOne, "v@:");
        return YES;
    }
    
    // 如果找不到方法，就添加一个addMethod来执行
    [self addMethodWithSEL:sel methodIMP:@selector(addMethod)];
    return YES;
}

void MethodOne(id self, SEL _cmd) {
    
    NSLog(@"接收到名字是wh_addMethod的方法,就会来到这个添加的方法里\n\n\n");
}


- (void)addMethod {
    
    NSLog(@"接收到未知的消息,就会来到这个添加的方法里\n\n\n");
}


@end
