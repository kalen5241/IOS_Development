#import "NSArray+Log.h"

@implementation NSArray (Log)


//用于直接改写NSArray的description样式，可以直接输出为Json的标准格式，免去自己手动改为Json格式了。
- (NSString *)descriptionWithLocale:(id)locale {
    
    NSMutableString *strM = [NSMutableString stringWithString:@"[\n"];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@"]"];
    
    return strM;
}

@end