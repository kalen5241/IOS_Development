//
//  RemindedTableView.m
//  CarSecretary
//
//  Created by wenjuan on 15/11/27.
//  Copyright © 2015年 Chewen. All rights reserved.
//

#import "RemindedTableView.h"
#import "PhoneTableViewCell.h"
#import <objc/runtime.h>


#define OBJC_TABLEVIEW_BLOCK @"remindedTableView_objc_block"

#define SHOW_CELL_NUMBER  4
#define SHOW_TABLE_HEIGHT 40*4*SCREEN_SCALE
#define SHOW_CELL_HEIGHT 40*SCREEN_SCALE
@interface RemindedTableView()<UITableViewDataSource,UITableViewDelegate>

{
    //tableView的高度
    CGFloat phoneTableViewH;
}

@end


@implementation RemindedTableView 

/**
 *  创建列表
 * @param  phonePasswordArray        数据源
 * @param  frame                     大小
 * @param  block                     回调方法
 */
+ (RemindedTableView *)phonePasswordTableView:(NSMutableArray *)phonePasswordArray andFrame:(CGRect)frame compeletion:(void(^)(RemindedTableView  *remindPPArray))block  {

    RemindedTableView *remind = [[self alloc]initPhonePasswordTableView:phonePasswordArray andFrame:frame compeletion:block];
    return remind;
}


- (id)initPhonePasswordTableView:(NSMutableArray *)phonePasswordArray andFrame:(CGRect)frame compeletion:(void(^)(RemindedTableView  *remindPPArray))block {
    
    objc_setAssociatedObject(self, OBJC_TABLEVIEW_BLOCK, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self = [self initWithFrame:frame]) {
        self.phonePasswordArray = phonePasswordArray;
        if ([self.phonePasswordArray count] < SHOW_CELL_NUMBER) {
            phoneTableViewH = [phonePasswordArray count] * SHOW_CELL_HEIGHT;
        }else {
            phoneTableViewH = SHOW_TABLE_HEIGHT;
        }
    }
    return self;
}


//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        self.backgroundColor = RGB(69, 71, 76);
//        self.layer.cornerRadius = 10.0;
//        self.layer.shadowOffset = CGSizeMake(0, 1);
//        self.layer.shadowRadius = 3;
//        self.delegate = self;
//        self.dataSource = self;
//        self.separatorStyle = UITableViewCellSelectionStyleNone;
//        phoneTableViewH = 120;
//        _phonePasswordArray = [NSMutableArray array];
//    }
//    return self;
//}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = RGB(255, 255, 255);
        //self.backgroundColor = [UIColor redColor];
//        self.layer.cornerRadius = 10.0;
//        self.layer.shadowOffset = CGSizeMake(12, 12);
//        self.layer.shadowColor = [UIColor redColor].CGColor;

        self.layer.borderColor = cwGreyColor.CGColor;
        self.layer.borderWidth = 1.0f;
        self.layer.shadowRadius = 3;
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSelectionStyleNone;
        phoneTableViewH = SHOW_TABLE_HEIGHT;
        _phoneTableViewY = frame.origin.y;
        _phonePasswordArray = [NSMutableArray array];
    }
    return self;
}

//删除已有的电话号
- (void)deleteSelected:(NSInteger)tag {
    
    self.selectOrDeleget = @"0";
    [_phonePasswordArray removeObjectAtIndex:tag];
    
    if (![_phonePasswordArray count]) {
        phoneTableViewH = 0;
    }else {
        if([_phonePasswordArray count] < SHOW_CELL_NUMBER) {
            phoneTableViewH = SHOW_CELL_HEIGHT*[_phonePasswordArray count];
        }
    }
    [[NSUserDefaults standardUserDefaults]setObject:_phonePasswordArray forKey:@"savePhoneAndPassword"];
    self.savePasswordState = YES;
    
    void(^block)(RemindedTableView  *remindPPArray) = objc_getAssociatedObject(self, OBJC_TABLEVIEW_BLOCK);
    __block typeof (self) weakSelf = self;
    block(weakSelf);
    
    //调整tableview的高度
    [self changeMove];
}


/**
 *  tableview  数据源改变 table的也高度改变
 */
- (void)changeMove{
    [self reloadData];
    
//    [UIView animateWithDuration:0.5 animations:^{
//        CGRect tableRect = self.frame ;
//        tableRect.origin.y = _phoneTableViewY - phoneTableViewH;
//        tableRect.size.height = phoneTableViewH;
//        self.frame = tableRect;
// 
//    }];
//
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_masonryView.mas_bottom).offset(-2);
        make.width.equalTo(_masonryView.mas_width);
        make.centerX.equalTo(_masonryView.mas_centerX);
        make.height.equalTo(@(phoneTableViewH));
    }];
    
    
    
}



/**
 *  tableView 隐藏动画
 */
- (void)downMove {
//    [UIView animateWithDuration:0.5 animations:^{
//        CGRect tableRect = self.frame ;
//        tableRect.origin.y = _phoneTableViewY ;
//        tableRect.size.height = 0;
//        self.frame = tableRect;
//        
//    }];
    
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_masonryView.mas_bottom).offset(-2);
        make.width.equalTo(_masonryView.mas_width);
        make.centerX.equalTo(_masonryView.mas_centerX);
        make.height.equalTo(@0);
    }];
}


#pragma mark - UITableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * identifier = @"cells";
    PhoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PhoneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    cell.textLabel.text = @"1231243";
    NSDictionary * dic = [_phonePasswordArray objectAtIndex:indexPath.row];
    
    cell.phoneString = [dic objectForKey:@"phone"];
    [cell.deleButton addTarget:self action:@selector(tableDeleButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.deleButton.tag = indexPath.row;
    [cell.phoneLabel addTarget:self action:@selector(phoneButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.phoneLabel.tag = indexPath.row;
    
    return cell;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    if (![_phonePasswordArray count]) {
        
        return 0;
    }else {
        
        return _phonePasswordArray.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return SHOW_CELL_HEIGHT;
    
}


//删除一个电话号码
- (void)tableDeleButton:(UIButton *)button {
    //NSLog(@"buttong tableViewCell tag = %ld",button.tag);
    
    [self deleteSelected:button.tag];
}

//选中的电话号码
- (void)phoneButton:(UIButton *)button {
    //    NSLog(@"phone label tag = %ld  %@",button.tag,[phonePasswordArray objectAtIndex:button.tag]);
    NSDictionary * dic = [_phonePasswordArray objectAtIndex:button.tag];
    self.phone  = [dic objectForKey:@"phone"];
    self.password  = [dic objectForKey:@"password"];
    
    //判断密码是否已经记住
    if (![[dic objectForKey:@"password"] isEqualToString:@""]) {
        self.savePasswordState = NO;
    }else {
        self.savePasswordState = YES;
    }
    
    //设置cell的选中状态
//    NSIndexPath *pathOne=[NSIndexPath indexPathForRow:button.tag inSection:0];
//    PhoneTableViewCell *cellOne=(PhoneTableViewCell *)[self cellForRowAtIndexPath:pathOne];
//    cellOne.backgroundColor = [UIColor lightGrayColor];
    
    //选中后tableView隐藏的动画
    [self downMove];
    
    //区别 选中还是删除
    self.selectOrDeleget = @"1";
    
    void(^block)(RemindedTableView  *remindPPArray) = objc_getAssociatedObject(self, OBJC_TABLEVIEW_BLOCK);
    __block typeof (self) weakSelf = self;
    
    block(weakSelf);

}



+ (RemindedTableView *)phonePasswordTableView:(NSMutableArray *)phonePasswordArray andView:(UIView *)masonryView compeletion:(void(^)(RemindedTableView  *remindPPArray))block {
    RemindedTableView *remind = [[self alloc]initPhonePasswordTableView:phonePasswordArray andView:masonryView compeletion:block];
    return remind;
}

- (id)initPhonePasswordTableView:(NSMutableArray *)phonePasswordArray andView:(UIView *)masonryView compeletion:(void(^)(RemindedTableView  *remindPPArray))block {
    
    objc_setAssociatedObject(self, OBJC_TABLEVIEW_BLOCK, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self = [self initWithFrame:CGRectZero]) {
        self.phonePasswordArray = phonePasswordArray;
        self.masonryView = masonryView;
        if ([self.phonePasswordArray count] < SHOW_CELL_NUMBER) {
            phoneTableViewH = [phonePasswordArray count] * SHOW_CELL_HEIGHT;
        }else {
            phoneTableViewH = SHOW_TABLE_HEIGHT;
        }
        
    }
    return self;
}

- (void)showTable {
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_masonryView.mas_top);
        make.width.equalTo(_masonryView.mas_width);
        make.centerX.equalTo(_masonryView.mas_centerX);
        make.height.equalTo(@120);
    }];

}

@end
