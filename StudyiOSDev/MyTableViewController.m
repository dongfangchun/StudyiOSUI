//
//  MyTableViewController.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/4/8.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell1.h"
#import "MyTableViewCell2.h"

@interface MyTableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tbView;

@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#ifdef __IPHONE_7_0
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
#endif

    
    [self.tbView registerNib:[UINib nibWithNibName:NSStringFromClass([MyTableViewCell1 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyTableViewCell1 class])];//若用xib布局
    [self.tbView registerNib:[UINib nibWithNibName:NSStringFromClass([MyTableViewCell2 class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([MyTableViewCell2 class])];//若用xib布局
    
    
//    [_tbView reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        MyTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyTableViewCell1 class])];
        return cell;
    }
    else if(indexPath.row == 1){
        MyTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MyTableViewCell2 class])];
        return cell;
        
    }
    return nil;
}



@end
