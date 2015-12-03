//
//  TRMessage.m
//  TMessage
//
//  Created by tarena on 15-5-29.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "TRMessage.h"

@implementation TRMessage


+ (NSMutableArray *)demoData{
    TRMessage *m1 = [[TRMessage alloc]init];
    m1.content = @"Hello 你好。";
    m1.fromMe = YES;
    
    TRMessage *m2 = [[TRMessage alloc]init];
    m2.content = @"还好吧";
    m2.fromMe = NO;
    
    TRMessage *m3 = [[TRMessage alloc]init];
    m3.content = @"最近怎么样啊";
    m3.fromMe = YES;
    
    TRMessage *m4 = [[TRMessage alloc]init];
    m4.content = @"最近还可以吧，不过不是很想和你聊天，我想静静，不要问我静静是谁";
    m4.fromMe = NO;
    
    TRMessage *m5 = [[TRMessage alloc]init];
    m5.content = @"这就真的没得聊了，呵呵呵呵呵呵呵。那我自己和自己聊天吧。再打点什么消息呢，要不就复制吧，只能复制了";
    m5.fromMe = YES;
    
    TRMessage *m6 = [[TRMessage alloc]init];
    m6.content = @"这就真的没得聊了，呵呵呵呵呵呵呵。那我自己和自己聊天吧。再打点什么消息呢，要不就复制吧，只能复制了";
    m6.fromMe = YES;
    
    TRMessage *m7 = [[TRMessage alloc]init];
    m7.content = @"这就真的没得聊了打点什么消息呢，要不就复制吧，只能复制了";
    m7.fromMe = NO;
    
    TRMessage *m8 = [[TRMessage alloc]init];
    m8.content = @"这就真的没得聊了，呵呵呵呵呵呵呵。那我自己和自己聊天吧。再打点什么消息呢，要不就复制吧，只能复制了";
    m8.fromMe = YES;
    
    return [@[m1,m2,m3,m4,m5,m6,m7,m8] mutableCopy];

}









@end
