#import "HTTPTool.h"
#import "JsonTools.h"

@implementation HTTPTool
+(void)sendRequest:(NSURL *)url{
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        if (responseCode == 200) {
            NSLog(@"返回成功：%@",[NSThread currentThread]);
            NSLog(@"%@",data);
            
            //待发送的消息，格式为多个键值对
            NSDictionary *message = @{@"JsonData":data};
            
            //获取通知中心
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            
            //发送通知
            //第一个参数：广播的名称
            //第二个参数：谁在发广播
            //第三个参数：发的消息内容是什么
            [center postNotificationName:@"update" object:self userInfo:message];
            
        }else{
            NSLog(@"错误原因是：%@",error.userInfo);
        }
        
    }];
    [task resume];
}


@end
