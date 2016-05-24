//
//  DataModel.h
//  TestAutoCell
//
//  Created by Huashen on 11/13/15.
//  Copyright © 2015 csc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *content;

+(instancetype)dataModelWithTitle:(NSString *)title content:(NSString *)content;
@end
