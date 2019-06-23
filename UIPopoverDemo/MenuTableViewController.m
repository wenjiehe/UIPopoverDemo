//
//  MenuTableViewController.m
//  UIPopoverDemo
//
//  Created by 贺文杰 on 2019/6/24.
//  Copyright © 2019 贺文杰. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()

@property(nonatomic,strong)NSArray *titleAry;

@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.tableView.tableFooterView = [UIView new];
    self.titleAry = @[@"布朗尼", @"提拉米苏", @"慕斯", @"乳酪蛋糕"];
}

- (void)dealloc
{
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - private
///根据数组重新设置高度
/*
- (CGSize)preferredContentSize
{
    if (self.presentingViewController && self.tableView) {
        CGSize tempSize = self.presentingViewController.view.bounds.size;
        tempSize.width = 150;
        if (self.titleAry.count > 0 && self.titleAry.count < 7) {
            self.tableView.scrollEnabled = NO;
            tempSize.height = self.titleAry.count * 50;
        }else{
            tempSize = [self.tableView sizeThatFits:tempSize];
        }
        CGSize size = tempSize;
        return size;
    }else{
        return [self preferredContentSize];
    }
}
*/

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"menuIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = self.titleAry[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{
        
    }];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
