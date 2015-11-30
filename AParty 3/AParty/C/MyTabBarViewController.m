//
//  MyTabBarViewController.m
//  
//
//  Created by JConnor on 11/11/15.
//
//
#import "MyViewController.h"
#import "MyTabBarViewController.h"
#import "HomeViewController.h"
#import "MassageViewController.h"
#import "MomentsViewController.h"
#import "ItemForMessageVC.h"
@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self customVC];
    [self customTabBar];
}

- (void)customVC
{
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    ItemForMessageVC *massageVC = [[ItemForMessageVC alloc] init];
    MomentsViewController *momentsVC = [UIStoryboard storyboardWithName:@"MomentsView" bundle:nil].instantiateInitialViewController;
    MyViewController *myVC = [[MyViewController alloc] init];
    
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeVC.navigationItem.title =  @"APARTY";
    
    UINavigationController *messageNav = [[UINavigationController alloc]initWithRootViewController:massageVC];
    massageVC.title =  @"message";
    
    UINavigationController *momentsNav = [[UINavigationController alloc]initWithRootViewController:momentsVC];
    momentsVC.title =  @"moments";

    UINavigationController *myNav = [[UINavigationController alloc]initWithRootViewController:myVC];
    myVC.title =  @"my";

    
    self.viewControllers = [NSArray arrayWithObjects:homeNav,momentsNav ,messageNav , myNav, nil];
    
    
    
    
    
    
    
}

- (void)customTabBar
{
    UIImageView *bgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbg"]];
    NSLog(@"%@",NSStringFromCGRect(bgView.frame));
    bgView.frame = CGRectMake(0, 0,self.view.frame.size.width, 50);
    bgView.userInteractionEnabled = YES;
    [self.tabBar addSubview:bgView];
    
    NSArray *titleArr = [NSArray arrayWithObjects:@" ",@" ",@" ",@" ", nil];
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.frame = CGRectMake(25 + i * 100, 5, 40, 40);
        btn.frame = CGRectMake(self.view.frame.size.width / 4*i+20, 5, 40, 40);
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar%d",i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_S%d",i]] forState:UIControlStateSelected];
        btn.tag = 1000 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:btn];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(-13, 32, 60, 13)];
        label.text =  titleArr[i];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor darkGrayColor];
        [btn addSubview:label];
    }
    
}

- (void)btnClick:(UIButton *)sender
{
    for (int i = 0; i < 4; i++) {
        UIButton *btn = (UIButton *)[self.tabBar viewWithTag:1000 + i];
        btn.selected = NO;
        UILabel *label = [[btn subviews]lastObject];
        label.textColor = [UIColor darkGrayColor];
    }
    sender.selected = YES;
    UILabel *label = [[sender subviews] lastObject];
    label.textColor = [UIColor purpleColor];
    
    self.selectedIndex = sender.tag - 1000;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
