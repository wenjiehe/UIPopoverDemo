//
//  ViewController.m
//  UIPopoverDemo
//
//  Created by 贺文杰 on 2019/6/24.
//  Copyright © 2019 贺文杰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UIButton *alertButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (IBAction)clickMenuButton:(UIButton *)sender {
    UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITableViewController *menuListVC = [mainSB instantiateViewControllerWithIdentifier:@"menuListVC"];
    //禁止tableView的滚动
    menuListVC.tableView.scrollEnabled = NO;
    //设置大小,这个我们也可以在控制器内部设置，让控制器自己决定
    menuListVC.preferredContentSize = CGSizeMake(200, 200);
    //设置style,必须设置UIModalPresentationPopover，才会出来蒙版
    menuListVC.modalPresentationStyle = UIModalPresentationPopover;
    //设置弹出的参照视图，rect参数是以view的左上角为坐标原点（0，0）
    menuListVC.popoverPresentationController.sourceView = sender;
    //锚点popover的指定视图矩形
    /*
        箭头所指对应的区域，首先根据sourceView，在sourceView描绘出一块区域（CGRect），然后箭头指定这块区域的中心店
     */
    menuListVC.popoverPresentationController.sourceRect = CGRectMake(CGRectGetWidth(sender.frame) / 2, CGRectGetHeight(sender.frame), 0, 0);
    //设置弹框的背景颜色
    menuListVC.popoverPresentationController.backgroundColor = [UIColor orangeColor];
    /*
    这里就是去设置可以穿透的view，就是当menuListVC已经弹出来了，后面有蒙版了，我们点击后面的某个view是可以点击的，并且这个menuListVC不会消失
    */
    menuListVC.popoverPresentationController.passthroughViews = @[self.alertButton];
    //设置弹出视图的箭头方向
    menuListVC.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //设置代理
    menuListVC.popoverPresentationController.delegate = self;
    [self presentViewController:menuListVC animated:YES completion:^{
        
    }];
}

- (IBAction)clickAlertButton:(UIButton *)sender {
    NSLog(@"点击了提示按钮");
}

#pragma mark -
#pragma mark -- UIPopoverPresentationControllerDelegate
//模态弹出框窗口时触发的方法，可以进行数据传输
- (void)prepareForPopoverPresentation:(UIPopoverPresentationController *)popoverPresentationController
{
    
}

//将要关闭弹出框窗口时触发的方法
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    return YES;
}

//已经关闭弹出框窗口时触发的方法
- (void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    
}

//弹出框将要复位到指定视图区域时触发的方法
- (void)popoverPresentationController:(UIPopoverPresentationController *)popoverPresentationController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView  * __nonnull * __nonnull)view
{
    
}

//默认弹出覆盖整个屏幕,在ipad下不会调用，在iphone下会调用,自定义弹框大小
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone;
}

@end
