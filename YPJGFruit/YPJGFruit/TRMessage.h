//
//  TRMessage.h
//  TMessage
//
//  Created by tarena on 15-5-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRMessage : NSObject

@property(nonatomic,strong)NSString *content;
@property(nonatomic)BOOL fromMe;


+(NSMutableArray *)demoData;


@end
