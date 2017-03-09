//
//  PreViewController.m
//  IOS_3DTouch_Demo
//
//  Created by NickyTsui on 16/1/3.
//  Copyright © 2016年 com.nickyTsui. All rights reserved.
//

#import "PreViewController.h"

@interface PreViewController ()

@end

@implementation PreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100,30)];
    label.center = self.view.center;
    label.text = [NSString stringWithFormat:@"当前第%zd页",self.currentPage];
    [self.view addSubview:label];
    
    // Do any additional setup after loading the view.
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 在iOS9 中 UITouch对象加入了 force属性,对应的是3dtouch的力度
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        UITouch *touch = [[touches allObjects]lastObject];
        NSLog(@"%lf",touch.force);
    }
}
#pragma mark 代理方法,设置 这个页面可以选择的按钮(3dtouch 呼出预览页后处于下方的按钮)
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *itemA = [UIPreviewAction actionWithTitle:@"加入购物车" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"你要做的操作");
    }];
    return @[itemA];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
