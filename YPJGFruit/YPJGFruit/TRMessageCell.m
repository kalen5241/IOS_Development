//
//  TRMessageCell.m
//  TMessage
//
//  Created by tarena on 15-5-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMessageCell.h"

@interface TRMessageCell ()

//增加显示数据的标签和图片
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)UIImageView *popImageView;

@end

@implementation TRMessageCell

#define CELL_MARGIN_TB      4.0     //气泡上下外边距
#define CELL_MARGIN_LR      10.0    //气泡左右外边距

#define CELL_CORNOR         18.0    //气泡圆角半径
#define CELL_TAIL_WIDTH     16.0    //气泡尾巴

#define MAX_WIDTH_OF_TEXT   200.0   //文字宽度限制
#define CELL_PADDING        8.0        //气泡内边距

- (void)setMessage:(TRMessage *)message{
    _message = message;
    //开始对图片和标签计算frame，并添加到cell中
    self.label.text = message.content;
    //根据消息的来源，对label和气泡进行定位
    if (message.fromMe) {//蓝色气泡，在右侧
        self.label.textColor = [UIColor whiteColor];
        UIImage *image = [[UIImage imageNamed:@"message_i"] resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR, CELL_CORNOR, CELL_CORNOR+CELL_TAIL_WIDTH) resizingMode:UIImageResizingModeStretch];
        self.popImageView.image  = image;
        //1.定位label
        // 确定文本的高度
        CGRect rectOfText = CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999);
        rectOfText = [self.label textRectForBounds:rectOfText limitedToNumberOfLines:0];
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = rectOfText.size;
        frameOfLabel.origin.x = self.bounds.size.width-CELL_MARGIN_LR-CELL_TAIL_WIDTH-CELL_PADDING-rectOfText.size.width;
        frameOfLabel.origin.y = CELL_MARGIN_TB+CELL_PADDING;
        self.label.frame = frameOfLabel;
        
        //2.定位popImageView的坐标
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x -= CELL_PADDING;
        frameOfPop.origin.y -= CELL_PADDING;
        frameOfPop.size.width += 2*CELL_PADDING+CELL_TAIL_WIDTH;
        frameOfPop.size.height += 2*CELL_PADDING ;
        self.popImageView.frame = frameOfPop;
        
        //3.设定单元的bounds
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height+2*CELL_MARGIN_TB;
        self.bounds = bounds;
    }else{//灰色气泡
        self.label.textColor = [UIColor darkGrayColor];
        UIImage *image = [[UIImage imageNamed:@"message_other"] resizableImageWithCapInsets:UIEdgeInsetsMake(CELL_CORNOR, CELL_CORNOR+CELL_TAIL_WIDTH, CELL_CORNOR, CELL_CORNOR) resizingMode:UIImageResizingModeStretch];
        self.popImageView.image  = image;
        //1.定位label
        // 确定文本的高度
        CGRect rectOfText = CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999);
        rectOfText = [self.label textRectForBounds:rectOfText limitedToNumberOfLines:0];
        CGRect frameOfLabel = CGRectZero;
        frameOfLabel.size = rectOfText.size;
        frameOfLabel.origin.x = CELL_PADDING+CELL_TAIL_WIDTH+CELL_MARGIN_LR;
        frameOfLabel.origin.y = CELL_MARGIN_TB+CELL_PADDING;
        self.label.frame = frameOfLabel;
        
        //2.定位popImageView的坐标
        CGRect frameOfPop = frameOfLabel;
        frameOfPop.origin.x -= (CELL_PADDING+CELL_TAIL_WIDTH);
        frameOfPop.origin.y -= CELL_PADDING;
        frameOfPop.size.width += 2*CELL_PADDING+CELL_TAIL_WIDTH;
        frameOfPop.size.height += 2*CELL_PADDING ;
        self.popImageView.frame = frameOfPop;
        
        //3.设定单元的bounds
        CGRect bounds = self.bounds;
        bounds.size.height = frameOfPop.size.height+2*CELL_MARGIN_TB;
        self.bounds = bounds;
    
    }
    [self.contentView addSubview:self.popImageView];
    [self.contentView addSubview:self.label];
}


- (UILabel *)label{
    if (!_label) {
        _label = [[UILabel alloc]init];
        _label.numberOfLines = 0;
    }
    return _label;
}

- (UIImageView *)popImageView{
    if (!_popImageView) {
        _popImageView = [[UIImageView alloc]init];
    }
    return _popImageView;
}


@end
