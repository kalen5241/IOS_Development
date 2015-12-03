//
//  MessageVC.m
//  YPJGFruit
//
//  Created by kalen on 15/8/16.
//  Copyright (c) 2015年 kalen. All rights reserved.
//

#import "MessageVC.h"
#import "TRMessageCell.h"
#import "TRMessage.h"
@interface MessageVC () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign) CGFloat topGuide;
@property (nonatomic,assign) CGFloat bottomGuide;
@property (nonatomic,strong) NSLayoutConstraint *lastConstraint;
@property (nonatomic,strong) UITableView *chatTabelView;

@end

@implementation MessageVC

-(void)viewWillAppear:(BOOL)animated{
}

-(void)viewWillLayoutSubviews{
    self.topGuide = [self.topLayoutGuide length];
    self.bottomGuide = [self.bottomLayoutGuide length];
    //NSLog(@"%f",[self.topLayoutGuide length]);
    //NSLog(@"%f",[self.bottomLayoutGuide length]);
}

-(void)viewDidLayoutSubviews{
    NSLog(@"%f",[self.topLayoutGuide length]);
    NSLog(@"%f",[self.bottomLayoutGuide length]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view = [[[NSBundle mainBundle] loadNibNamed:@"ChatInputPart" owner:nil options:nil] lastObject];
    //self.view = [InputBox view];
    
    UIImageView *myImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ToolViewBkg_Black"]];
    
    //*Important* You must enable the userInteraction of the Imageview, otherwise the textField has no respond to click event
    myImageView.userInteractionEnabled = YES;
    //close autoresizing function
    [myImageView setTranslatesAutoresizingMaskIntoConstraints:false];
    [self.view  addSubview:myImageView];
    
    UITextField *myTextField = [[UITextField alloc]init];
    [myTextField setTranslatesAutoresizingMaskIntoConstraints:false];
    myTextField.backgroundColor = [UIColor grayColor];
    myTextField.textColor = [UIColor whiteColor];
    [myImageView addSubview:myTextField];
    
    UITableView *myTableView = [[UITableView alloc]init];
    
    myTableView.backgroundColor = [UIColor clearColor];
    [myTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [myTableView setTranslatesAutoresizingMaskIntoConstraints:false];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myDismissKeyboard)];
    myTableView.dataSource = self;
    myTableView.delegate = self;
    [myTableView addGestureRecognizer:tap];
    [self.view  addSubview:myTableView];
    self.chatTabelView = myTableView;
    NSDictionary *views = @{@"textField":myTextField, @"imageView":myImageView,@"tableView":myTableView};
    
    // add the constraint to the textfield
    NSString *tHC = @"H:|-5-[textField]-5-|";
    
    NSArray *tHCC = [NSLayoutConstraint constraintsWithVisualFormat:tHC options:0 metrics:nil views:views];
    
    
    NSDictionary *mymetrics = @{@"lt":@5,@"space":@5,@"rb":@5};
    NSString *tVC = @"V:|-lt-[myTextField]-rb-|";
    NSDictionary *myViews = NSDictionaryOfVariableBindings(myTextField);
    NSArray *tVCC = [NSLayoutConstraint constraintsWithVisualFormat:tVC options:0 metrics:mymetrics views:myViews];
    NSLog(@"测试NSDictionaryOfVariableBindings is %@",myViews);
    
    [myImageView addConstraints:tVCC];
    [myImageView addConstraints:tHCC];
    
    
    //add horizontal constraints
    NSString *imageH = @"H:|-0-[imageView]-0-|";
    NSArray *imageHConstraint = [NSLayoutConstraint constraintsWithVisualFormat:imageH options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    
    
    NSString *tableViewH = @"H:|-0-[tableView]-0-|";
    NSArray *tableViewHConstraint = [NSLayoutConstraint constraintsWithVisualFormat:tableViewH options:NSLayoutFormatAlignAllCenterY metrics:nil views:views];
    
    //add vertical constraints
    NSString *imageV = @"V:|-64-[tableView]-0-[imageView(40)]-0-|";
    NSArray *imageVConstraint = [NSLayoutConstraint constraintsWithVisualFormat:imageV options:0 metrics:nil views:views];
    
    [self.view  addConstraints:imageHConstraint];
    [self.view  addConstraints:imageVConstraint];
    [self.view  addConstraints:tableViewHConstraint];
    self.lastConstraint = [imageVConstraint lastObject];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTextField1:) name:UIKeyboardDidChangeFrameNotification object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTextField2:) name:UIKeyboardWillHideNotification object:nil];
    
    NSLog(@"chatTableView contentOffset x is %f",self.chatTabelView.contentOffset.x);
    NSLog(@"chatTableView contentOffset y is %f",self.chatTabelView.contentOffset.y);
    [self scrollToLastRow];
}
-(void)changeTextField1:(NSNotification *)noti{
    NSLog(@"chatTableView contentOffset x is %f",self.chatTabelView.contentOffset.x);
    NSLog(@"chatTableView contentOffset y is %f",self.chatTabelView.contentOffset.y);
    CGRect ySet = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    double y = [[UIScreen mainScreen] bounds].size.height - ySet.origin.y;
    self.lastConstraint.constant = y;
    self.chatTabelView.contentInset = UIEdgeInsetsMake(0, 0, y, 0);
    
    //self.chatTabelView.frame.size.height
    [self scrollToLastRow];
    self.chatTabelView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
}

-(void)changeTextField2:(NSNotification *)noti{
    NSLog(@"chatTableView contentOffset x is %f",self.chatTabelView.contentOffset.x);
    NSLog(@"chatTableView contentOffset y is %f",self.chatTabelView.contentOffset.y);
    CGRect ySet = [[noti.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    double y = [[UIScreen mainScreen] bounds].size.height - ySet.origin.y;
    self.lastConstraint.constant = y;
    [self scrollToLastRow];
}

-(void)myDismissKeyboard{
    [self.view endEditing:YES];
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableVie{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [TRMessage demoData].count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCell"];
    if (!cell) {
        cell = [[TRMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ChatCell"];
        cell.frame = tableView.frame;
    }
    TRMessage *temp = [TRMessage demoData][indexPath.row];
    cell.message = temp;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}


-(void)scrollToLastRow{
    NSIndexPath *chatIndexPath = [NSIndexPath indexPathForRow:[TRMessage demoData].count-1 inSection:0];
    [self.chatTabelView scrollToRowAtIndexPath:chatIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    [self.chatTabelView reloadData];
}




@end
