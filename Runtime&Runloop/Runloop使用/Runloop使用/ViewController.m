//
//  ViewController.m
//  Runloop使用
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong,nonatomic)NSThread *thread;  //记得使用Strong属性
- (IBAction)showSource:(id)sender;     //点击按钮，添加RunLoop事件源用。
- (IBAction)addTime:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建自定义的子线程
    self.thread = [[NSThread alloc]initWithTarget:self selector:@selector(threadMethod) object:nil];
    [self.thread start];  //启动子线程
}
-(void)threadMethod
{
    NSLog(@"打开子线程方法");
    while (1) {
        
        //条件一：run，进入循环，如果没有source/timer就直接退出，不进入循环，后面加上source才能进入工作。
        /*【原因：如果线程中有需要处理的源，但是响应的事件没有到来的时候，线程就会休眠等待相应事件的发生;
         这就是为什么run loop可以做到让线程有工作的时候忙于工作，而没工作的时候处于休眠状态。】
         */
        [[NSRunLoop currentRunLoop]run];
        
        //上面一行代码等于加了参数为1的while，所以当有source进入循环，下面这条代码的就不会运行。
        NSLog(@"这里是threadMethod：%@", [NSThread currentThread]);
        //如果要测试“二、addTime”按钮的话，建议注释掉上面这句代码。
    }
}

#pragma mark -- 测试一：子线程Selector源的启动
- (IBAction)showSource:(id)sender {
    
    //注意：在这个方法里面输出的是main主线程，因为是主线程运行的UI控件行为。
    NSLog(@"这里是主线程：%@",[NSThread currentThread]);
    /*
     在没有run之前，一直处于休眠状态。所以如果要运行selector方法，还需要threadMethod中条件一不断循环的Run！
     在我们指定的线程中调用方法，此处相当于增加了一个带source的mode，有内容,实现了RunLoop循环运行成立的条件二。
     */
    //试着在这句之前添加[[NSRunLoop currentRunLoop]run];是不能启动子线程的RunLoop，因为此处是在main主线程上。
    [self performSelector:@selector(threadSelector) onThread:self.thread withObject:nil waitUntilDone:NO];
}
-(void)threadSelector//【此处运行在子线程】
{
    NSLog(@"打开子线程Selector源");
    NSLog(@"此处是threadSelector源：%@",[NSThread currentThread]);
}


#pragma mark -- 二、Time测试
- (IBAction)addTime:(UIButton *)sender {
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(showTimer) userInfo:nil repeats:YES];
    //添加timer到RunLoop
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(showTimer) userInfo:nil repeats:YES];
//    
//    //使用scheduledTimerWithTimeInterval方法，会自动添加到RunLoop，所以可以不写以下代码，只是会默认为NSDefaultRunLoopMode模式
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
}

-(void)showTimer   //【在主线程】
{
    NSLog(@"调用time的线程：%@",[NSThread currentThread]);
    [self showText:@"-------time-------"];
    
    /*
     关于mode模式：
     
     操作：当点击addTime按钮后，textView控件上不断显示“-------time-------”，但是当我们拖拽textView进度条上下移动时，会发现"-(void)showTime："不会执行，textView控件上的内容不再增加“-------time-------”，就像“卡住了，死机了”一样。当我们停止对textView进行拖拽后，控件上的内容又不断添加更新了。
     
     解决方案：修改mode类型：把默认模式NSDefaultRunLoopMode改为占位符NSRunLoopCommonModes；
     
     发现如果修改成这样，那么即使我们对textView进行拖拽，内容会一直增加“-------time-------”，再也不会由于拖拽而被牵制住了。
     
     原因：每次RunLoop只能支持一种mode。当我们点击addtime按钮后，定时源（timer）加入到RunLoop中，而当滑动textView时，RunLoop自动切换成UITrackingRunLoopMode模式，定时器就停止了响应。
     
     而NSRunLoopCommonModes等效于NSDefaultRunLoopMode和NSEventTrackingRunLoopMode两种模式的结合
     
     所以当我们在带有 “Common ”标记的NSRunLoopCommonModes模式下添加定时源（timer）后。即使我们对textView进行滚动操作，也不会影响到内容的显示了。
     */
}

#pragma mark --在文本控件textView后面增加str字符串
-(void)showText:(NSString *)str  //注意：因为UI控件需要在主线程里面，尝试一下，如果是在子线程threadMethod方法执行此段代码则运行报错。
{
    NSString *text = self.textView.text;
    self.textView.text = [text stringByAppendingString:str];
}


@end
