#import "NSArray+Log.h"

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [strM appendFormat:@"\t\t\"%@\":%@\n", key, obj];
        }else{
            [strM appendFormat:@"\t\t\"%@\":\"%@\"\n", key, obj];
        }
    }];
    
    [strM appendString:@"\t}"];
    
    return strM;
}

@end