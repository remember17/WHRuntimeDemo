//
//  ViewController.m
//  WHRuntimeDemo
//  https://github.com/remember17/WHRuntimeDemo
//  Created by 吴浩 on 2017/6/20.
//  Copyright © 2017年 wuhao. All rights reserved.
//

#import "ViewController.h"
#import "TestRuntime.h"
#import "NSObject+WHRuntime.h"
#import <objc/message.h>
#import "UIImage+swizzlingImage.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 属性列表 */
    [self properties];
    
    /** 成员变量列表 */
    [self ivar];
    
    /** 实例方法列表 */
    [self instanceMethod];
    
    /** 类方法列表 */
    [self classMethod];
    
    /** 协议列表 */
    [self protocol];
    
    /** 测试方法交换 */
    [self swizzlingMethod];
    
    /** 添加方法 */
    [self addMethod];
    
    
    /** 调用私有方法 */
    [self privateMethod];
    
    /** 给分类添加属性 */
    [self categoryProperty];
}


- (void)properties {
    NSLog(@"==================属性========================\n\n\n");
    NSLog(@"属性列表%@\n\n\n",[TestRuntime propertiesInfo]);
    NSLog(@"格式化了的属性列表%@\n\n\n",[TestRuntime propertiesWithCodeFormat]);
}


- (void)ivar {
    NSLog(@"=================成员变量=======================\n\n\n");
    NSLog(@"成员变量列表%@\n\n\n",[TestRuntime ivarInfo]);
}


- (void)instanceMethod {
    NSLog(@"==================实例方法======================\n\n\n");
    NSLog(@"实例方法列表%@\n\n\n",[TestRuntime instanceMethodList]);
}


- (void)classMethod {
    NSLog(@"==================类方法========================\n\n\n");
    NSLog(@"类方法列表%@\n\n\n",[TestRuntime classMethodList]);
}


- (void)protocol {
    NSLog(@"===================协议=========================\n\n\n");
    NSLog(@"协议列表%@\n\n\n",[TestRuntime protocolList]);
}


- (void)swizzlingMethod {
    NSLog(@"==================方法交换=========================\n\n\n");
    
    /**
     * 本地并没有叫做@"anyPicture"的图片
     * 不过由于在UIImage+swizzlingImage.m中运用runtime进行了方法交换
     * 在交换的方法中安排了占位图片
     * 所有会有一张图片显示
     * 
     * 应用情景:从网络加载的图片失败，就显示占位图片.并且还是直接用imageNamed:
     */
    UIImage *image = [UIImage imageNamed:@"anyPicture"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 200, 200);
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
}


- (void)addMethod {
    NSLog(@"=============找不到方法====添加方法==================\n\n\n");
    
    /**
     * 接收到未知的消息时，
     * 首先会调用所属类的类方法+resolveInstanceMethod:(实例方法)或+resolveClassMethod:(类方法)
     * 添加的方法在TestRuntime类的resolveInstanceMethod中
     */
    
    // 1.如果方法名是wh_addMethod，就添加一个MethodOne方法来执行
    TestRuntime *test1 = [[TestRuntime alloc] init];
    [test1 performSelector:@selector(wh_addMethod)];
    
    // 2.如果找不到方法，就添加一个addMethod来执行
    id test2 = [[TestRuntime alloc] init];
    [test2 length];
}


- (void)privateMethod {
    NSLog(@"=================调用私有方法=====================\n\n\n");
    TestRuntime *test = [[TestRuntime alloc] init];
    objc_msgSend(test, @selector(privateMethod));
}


- (void)categoryProperty {
    NSLog(@"===============给分类添加属性=====================\n\n\n");
    UIImage *image = [[UIImage alloc] init];
    image.categoryProperty = @"运用runtime给分类添加属性,使UIimage有了一个字符串属性\n\n\n";
    NSLog(@"%@",image.categoryProperty);
}

@end
