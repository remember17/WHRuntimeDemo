//
//  UIImage+swizzlingImage.h
//  WHRuntimeDemo
//  https://github.com/remember17/WHRuntimeDemo
//  Created by 吴浩 on 2017/6/20.
//  Copyright © 2017年 wuhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (swizzlingImage)

// 用关联对象为分类添加属性
@property (nonatomic, copy) NSString *categoryProperty;

@end
