//
//  TRMessageCell.h
//  TMessage
//
//  Created by tarena on 15-5-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRMessage.h"

@interface TRMessageCell : UITableViewCell

//公开一个可以存储要显示的消息属性
@property(nonatomic,strong)TRMessage *message;

@end








