//
//  LDSubclassViewController.m
//  KVO实例动态替换
//
//  Created by mfang032 on 27/03/2017.
//  Copyright © 2017 mfang032. All rights reserved.
//

#import "LDSubclassViewController.h"

@interface LDSubclassViewController ()

@end

@implementation LDSubclassViewController

- (void)eat {
    
    NSLog(@"newSubClass eat");
    
    struct objc_super superClazz = {
        .receiver = self,
        .super_class = class_getSuperclass(object_getClass(self))
    };
    
    //调用原方法
    void (*objc_msgSendSuperCasted)(void *, SEL) = (void *)objc_msgSendSuper;
    objc_msgSendSuperCasted(&superClazz, _cmd);
    
    
    
    
    
    
    
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
