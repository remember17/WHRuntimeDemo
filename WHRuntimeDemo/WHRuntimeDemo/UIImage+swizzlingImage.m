//
//  UIImage+swizzlingImage.m
//  WHRuntimeDemo
//  https://github.com/remember17/WHRuntimeDemo
//  Created by 吴浩 on 2017/6/20.
//  Copyright © 2017年 wuhao. All rights reserved.
//

#import "UIImage+swizzlingImage.h"
#import "NSObject+WHRuntime.h"

@interface UIImage()

@end

@implementation UIImage (swizzlingImage)

+(void)load {
    
    //只执行一次,方法交换放到+load方法里
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //方法交换
        [self SwizzlingClassMethodWithOldMethod:@selector(imageNamed:) newMethod:@selector(wh_imageNamed:)];
        
    });
}

+ (nullable UIImage *)wh_imageNamed:(NSString *)name {
    
    NSLog(@"调用了被交换的方法wh_imageNamed\n\n\n");
    
    //如果图片存在，就显示
    if ([self wh_imageNamed:name]) {
        
        return [self wh_imageNamed:name];
        
    }else {
        
        //如果图片不存在，就显示占位图片
        return [self wh_imageNamed:@"test"];
        
    }
}



// getter
- (NSString *)categoryProperty {
    return objc_getAssociatedObject(self, _cmd);
}

// setter
- (void)setCategoryProperty:(NSString *)categoryProperty {
    objc_setAssociatedObject(self, @selector(categoryProperty), categoryProperty, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
