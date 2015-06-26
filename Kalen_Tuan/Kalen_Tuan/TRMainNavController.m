#import "TRMainNavController.h"
@interface TRMainNavController ()
@end
@implementation TRMainNavController
- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal.png"] forBarMetrics:UIBarMetricsDefault];
}
@end
