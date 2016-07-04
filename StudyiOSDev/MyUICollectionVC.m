//
//  MyUICollectionVC.m
//  StudyiOSDev
//
//  Created by 孙春杰 on 16/7/4.
//  Copyright © 2016年 孙春杰. All rights reserved.
//

#import "MyUICollectionVC.h"
#import "Header.h"

@interface MyUICollectionVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MyUICollectionVC

- (void)viewDidLoad {
    [super viewDidLoad];

    //add CollectionView 尽管重写了layout的函数，还是需要在这里定义一个layout，否则UICollectionView不能init成功
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    layout.sectionInset = UIEdgeInsetsMake(1, 5, 1, 5);//the section's margin .top left bottom right
    layout.minimumLineSpacing = 1.0f;//the space between each row
    layout.itemSize = CGSizeMake(80, 65);//each cell size
    layout.minimumInteritemSpacing = 3.0f;//the space in the same row
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;//scroll direction

    [self.collectionView registerClass:[UICollectionViewCell class]
        forCellWithReuseIdentifier:@"Cell"];//cell
    [self.collectionView registerClass:[UICollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
               withReuseIdentifier:@"Header"];//header
    [self.collectionView registerClass:[UICollectionReusableView class]
        forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
               withReuseIdentifier:@"Footer"];//footer
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma collectionView

//num of section
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

//num in each section
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(section==0){
        return 11;
    }
    else if(section==1){
        return 4;
    }
    return 0;
}

//cell UI
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.1 alpha:0.5]];
    return cell;
}

//cell action
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Entering aciton %@",indexPath);
}

//cell did unselect
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"deselect");
}

//click down
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"high light");
}

//click up
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"unhigh light");
}

// header and footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    if([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header"forIndexPath:indexPath];
        view.backgroundColor = [UIColor greenColor];
        for (UIView *viewEle in [view subviews]) {
            [viewEle removeFromSuperview];
        }
        UIButton *btnTmp = [[UIButton alloc]initWithFrame:CGRectMake(2, 2, 10, 10)];
        [btnTmp setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
        [view addSubview:btnTmp];
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        view.backgroundColor = [UIColor grayColor];
    }
    return view;
}

//Layout
//each cell size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
        return CGSizeMake(ScreenWidth / 2 - 2, 40);
    return CGSizeMake(80, 65);
}

//the section's margin .top left bottom right
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if(section == 0)
        return UIEdgeInsetsMake(0, 0, 0, 0);
    return UIEdgeInsetsMake(1, 5, 1, 5);
}

//the space between each row
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if(section == 0)
        return 5.0f;
    return 1.0f;
}

//the space in the same row
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if(section == 0)
        return 1.0f;
    return 3.0f;
}

//header height
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(100, 10);
}

//footer height
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(100, 10);
}

@end
