//
//  ViewController.m
//  ThreadCommunication
//
//  Created by mfang032 on 2017/4/6.
//  Copyright © 2017年 mfang032. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self downloadImage];
}

- (void)downloadImage {
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=%E5%9B%BE%E7%89%87&hs=0&pn=0&spn=0&di=157484237350&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=4271053251%2C2424464488&os=2375022793%2C1835605452&simid=4247939438%2C550168575&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fpic55.nipic.com%2Ffile%2F20141208%2F19462408_171130083000_2.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fooo_z%26e3Bgtrtv_z%26e3Bv54AzdH3Fzi7wgptAzdH3F8c8n9d9_d_z%26e3Bip4s&gsm=0"];
        NSData *date = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:date];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imgView.image = img;
        }];
        
    }];
}


- (void)downloadImage2 {
    // 一般情况下, 在做企业开发时候, 都会定义一个全局的自定义队列, 便于使用
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    // 2.添加一个操作下载第一张图片
    __block UIImage *image1 = nil;
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url  = [NSURL URLWithString:@"http://imgcache.mysodao.com/img2/M04/8C/74/CgAPDk9dyjvS1AanAAJPpRypnFA573_700x0x1.JPG"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        image1 = [UIImage imageWithData:data];
    }];
    
    // 3.添加一个操作下载第二张图片
    __block UIImage *image2 = nil;
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url  = [NSURL URLWithString:@"http://imgcache.mysodao.com/img1/M02/EE/B5/CgAPDE-kEtqjE8CWAAg9m-Zz4qo025-22365300.JPG"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        image2 = [UIImage imageWithData:data];
    }];
    // 4.添加一个操作合成图片
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        [image1 drawInRect:CGRectMake(0, 0, 100, 200)];
        [image2 drawInRect:CGRectMake(100, 0, 100, 200)];
        UIImage *res = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        // 5.回到主线程更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imgView.image = res;
        }];
    }];
    
    // 6.添加依赖
    
    [op3 addDependency:op1];
    [op3 addDependency:op2];
    
    // 7.添加操作到队列中
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
