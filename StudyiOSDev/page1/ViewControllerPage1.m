//
//  ViewControllerPage1.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/9.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "ViewControllerPage1.h"
#import "MyTableViewController.h"
#import "CustomNavViewController.h"
#import "BannerViewController.h"
#import "UIView+Toast.h"
#import "TTTLabelViewController.h"
#import "MJRefreshTableViewController.h"
#import "XXSegmentViewController.h"
#import "GifViewController.h"
#import "SDImageTestViewController.h"
#import "TestUIViewController.h"

@interface ViewControllerPage1 ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tbView;

@property (weak, nonatomic) NSObject *o;

@end


@implementation ViewControllerPage1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"常用效果列表";
}


- (IBAction)clickToBanner:(id)sender {
}

- (IBAction)clickToTableView:(id)sender {
    MyTableViewController *vcTb = [[MyTableViewController alloc]init];
    [self pushViewController:vcTb animated:YES];
}

#pragma mark - TableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell_Page1_Id"];
    if(!cell){
        cell = [[UITableViewCell alloc]init];
    }
    if(indexPath.row == 0){
        cell.textLabel.text = @"滚动Banner";
    }
    else if(indexPath.row == 1){
        cell.textLabel.text = @"toast";
    }
    else if(indexPath.row == 2){
        cell.textLabel.text = @"TTTAttrubuteLabel";
    }
    else if(indexPath.row == 3){
        cell.textLabel.text = @"MJRefresh";
    }
    else if(indexPath.row == 4){
        cell.textLabel.text = @"XXSegmentView";
    }
    else if(indexPath.row == 5){
        cell.textLabel.text = @"YYKit－image－GIF";
    }
    else if(indexPath.row == 6){
        cell.textLabel.text = @"SDWebImage";
    }
    else if(indexPath.row == 7){
        cell.textLabel.text = @"测试";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0){
        BannerViewController *vc = [[BannerViewController alloc]init];
        vc.navigationItem.title = @"滚动Banner";
        [self pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 1){
        [self.view makeToast:@"Toast" duration:1.0f position:CSToastPositionCenter];
    }
    else if(indexPath.row == 2){
        TTTLabelViewController *vc = [[TTTLabelViewController alloc]init];
        vc.navigationItem.title = @"滚动Banner";
        [self pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 3){
        MJRefreshTableViewController *vc = [[MJRefreshTableViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 4){
        XXSegmentViewController *vc = [[XXSegmentViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 5){
        GifViewController *vc = [[GifViewController alloc]init];
        [self pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 6){
        SDImageTestViewController *vc = [[SDImageTestViewController alloc]init];
        [self pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 7){
        TestUIViewController *vc = [[TestUIViewController alloc]init];
        [self pushViewController:vc  animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
