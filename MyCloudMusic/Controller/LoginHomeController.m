//
//  LoginHomeController.m
//  MyCloudMusic
//
//  Created by zyh on 2024/2/28.
//

#import "LoginHomeController.h"
#import "LoginController.h"

@interface LoginHomeController ()


/// 主按钮
@property (weak, nonatomic) IBOutlet UIButton *primaryButton;

@end

@implementation LoginHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 圆角
    self.primaryButton.layer.cornerRadius = 21;
    // 边框
    self.primaryButton.layer.borderColor = [UIColor colorNamed:@"Primary"].CGColor;
    self.primaryButton.layer.borderWidth = 1;
}


/// 主按钮点击
/// - Parameter sender: <#sender description#>
- (IBAction)primaryClick:(UIButton *)sender {
    NSLog(@"LoginHomeController primaryClick");
    
    // 获取到Main.storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *target = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
    
    [self.navigationController pushViewController:target animated:YES];
}

@end
