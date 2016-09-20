//
//  ViewController.m
//  IOS_3DTouch_Demo
//
//  Created by NickyTsui on 16/1/3.
//  Copyright © 2016年 com.nickyTsui. All rights reserved.
//

#import "ViewController.h"

#import "DemoCollectionViewCell.h"

//详情页
#import "PreViewController.h"

// UIViewControllerPreviewingDelegate 遵循预览协议
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UIViewControllerPreviewingDelegate>

@property (strong,nonatomic) UICollectionView       *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit{
    // 打开详情页触发
    if (viewControllerToCommit){
        [self showViewController:viewControllerToCommit sender:self];
    }
}
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location{
    // 1.我们可以通过触控的location获取 当前点击的是第几个元素(位于collectionview)
    // 2.由于响应3dtouch事件的view是cell的contentView,我们对触控拿到的location要进行一个转换(相对于collectionview(父视图)来说的位置
    // 3.这里通过previewingContext中sourceView获取到触摸的view
    UIView *contentView = previewingContext.sourceView;
    // 看回"2" 中第一句话,我们要拿到这个触控的location位于collectionview中的位置
    CGPoint iLocation = [contentView convertPoint:location toView:self.collectionView];
    // 将 获取到的位置 通过collectionview获取indexPath
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:iLocation];
    
    
    PreViewController *preViewController = [[PreViewController alloc]init];
    preViewController.currentPage = indexPath.item;
    
    return preViewController;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PreViewController *preViewController = [[PreViewController alloc]init];
    preViewController.currentPage = indexPath.item;
    
    [self.navigationController pushViewController:preViewController animated:YES];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DemoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cells" forIndexPath:indexPath];
    
    //设置代理
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0){
        cell.previewingDelegate = self;
    }
    
    
    return cell;
}
- (UICollectionView *)collectionView{
    if (!_collectionView){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        layout.itemSize = CGSizeMake(200, 100);
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[DemoCollectionViewCell class] forCellWithReuseIdentifier:@"cells"];
    }
    return _collectionView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
