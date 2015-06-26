//
//  TRDealsCollectionViewController.m
//  Kalen_Tuan
//
//  Created by tarena on 15/6/25.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRDealsCollectionViewController.h"
#import "TRNavLeftView.h"
#import "TRCategoryViewController.h"
#import "TRCategoryView.h"
@interface TRDealsCollectionViewController ()
//创建分类弹出控制器
@property (nonatomic,strong) UIPopoverController *categoryPopController;
@property (nonatomic,strong) TRNavLeftView *categoryView;

@end

@implementation TRDealsCollectionViewController

-(UIPopoverController *)categoryPopController{
    if (!_categoryPopController) {
        TRCategoryViewController *categoryView = [[TRCategoryViewController alloc]init];
        _categoryPopController = [[UIPopoverController alloc]initWithContentViewController:categoryView];
    }
    return _categoryPopController;
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //创建右边items
    [self setupRightItems];
    [self setupLeftItems];
}

-(void)setupLeftItems{
    UIBarButtonItem *logoItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil action:nil];
    logoItem.enabled=NO;
    //加载三个自定义的view
    //加载分类
    TRNavLeftView *categoryView = [TRNavLeftView view];
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryView];
    self.categoryView = categoryView;
    [self.categoryView addTarget:self action:@selector(clickCategoryView)];
    
    //加载区域城市
    TRNavLeftView *regionCityView = [TRNavLeftView view];
    UIBarButtonItem *regionCityItem = [[UIBarButtonItem alloc] initWithCustomView:regionCityView];
    //加载排序
    TRNavLeftView *sortView = [TRNavLeftView view];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortView];
    //添加 logo 分类 区域城市 排序
    self.navigationItem.leftBarButtonItems = @[logoItem,categoryItem,regionCityItem,sortItem];
}

-(void)clickCategoryView{
    NSLog(@"1111111111111");
    [self.categoryPopController presentPopoverFromRect:self.categoryView.bounds inView:self.categoryView permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark--创建右边items
-(void)setupRightItems{
    
    UIButton *mapButton = [[UIButton alloc]init];
    //[mapButton setBackgroundImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
    [mapButton setImage:[UIImage imageNamed:@"icon_map"] forState:UIControlStateNormal];
    [mapButton setImage:[UIImage imageNamed:@"icon_map_highlighted"] forState:UIControlStateHighlighted];
    [mapButton addTarget:self action:@selector(clickMap) forControlEvents:UIControlEventTouchUpInside];
    mapButton.frame = CGRectMake(0,0,50,40);
    //mapButton.backgroundColor =[UIColor redColor];
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc]initWithCustomView:mapButton];
    
    
    UIButton *searchButton = [[UIButton alloc]init];
    //[searchButton setBackgroundImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"icon_search"] forState:UIControlStateNormal];
    [searchButton setImage:[UIImage imageNamed:@"icon_search_highlighted"] forState:UIControlStateHighlighted];
    [searchButton addTarget:self action:@selector(clickSearch) forControlEvents:UIControlEventTouchUpInside];
    
    searchButton.frame = CGRectMake(0,0,60,40);
    //searchButton.backgroundColor =[UIColor blueColor];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    
    self.navigationItem.rightBarButtonItems = @[mapItem,searchItem];
}



-(void)clickSearch{
    
    
    
}

-(void)clickMap{
    
    
    
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
