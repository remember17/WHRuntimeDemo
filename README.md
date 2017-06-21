# WHRuntimeDemo
runtime运行时

### WHRuntimeDemo简介
Demo中有一个NSObject+WHRuntime.h分类，包含与runtime有关的方法，可以直接拿来使用。
```objc
/** 属性列表 */
- (NSArray *)propertiesInfo;
+ (NSArray *)propertiesInfo;
/** 格式化之后的属性列表 */
+ (NSArray *)propertiesWithCodeFormat;


/** 成员变量列表 */
- (NSArray *)ivarInfo;
+ (NSArray *)ivarInfo;


/** 对象方法列表 */
-(NSArray*)instanceMethodList;
+(NSArray*)instanceMethodList;
/** 类方法列表 */
+(NSArray*)classMethodList;


/** 协议列表 */
-(NSDictionary *)protocolList;
+(NSDictionary *)protocolList;


/** 交换实例方法 */
+ (void)SwizzlingInstanceMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;
/** 交换类方法 */
+ (void)SwizzlingClassMethodWithOldMethod:(SEL)oldMethod newMethod:(SEL)newMethod;


/** 添加方法 */
+ (void)addMethodWithSEL:(SEL)methodSEL methodIMP:(SEL)methodIMP;

```

### runtime相关知识点
请看这篇文章：[runtime运行时相关知识]（）
```
    runtime：Objective-C是动态语言，它将很多静态语言在编译和链接时做的事放到了运行时，这个运行时系统就是runtime。
    runtime其实就是一个库，它基本上是用C和汇编写的一套API，这个库使C语言有了面向对象的能力。

    静态语言：在编译的时候会决定调用哪个函数。
    动态语言（OC）：在运行的时候根据函数的名称找到对应的函数来调用。

    isa：OC中，类和类的实例在本质上没有区别，都是对象，任何对象都有isa指针，它指向类或元类（元类后面会讲解）。

    SEL：SEL（选择器）是方法的selector的指针。方法的selector表示运行时方法的名字。OC在编译时，会依据每一个方法的名字、参数，生成一个唯一的整型标识(Int类型的地址)，这个标识就是SEL。

    IMP：IMP是一个函数指针，指向方法最终实现的首地址。SEL就是为了查找方法的最终实现IMP。

    Method：用于表示类定义中的方法，它的结构体中包含一个SEL和IMP，相当于在SEL和IMP之间作了一个映射。

    消息机制：任何方法的调用本质就是发送一个消息。编译器会将消息表达式[receiver message]转化为一个消息函数objc_msgSend(receiver, selector)。

    Runtime的使用：获取属性列表，获取成员变量列表，获得方法列表，获取协议列表，方法交换（黑魔法），动态的添加方法，调用私有方法，为分类添加属性。
```