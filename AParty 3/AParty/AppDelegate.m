//
//  AppDelegate.m
//  AParty
//
//  Created by JConnor on 11/11/15.
//  Copyright (c) 2015 JConnor. All rights reserved.

#import "AppDelegate.h"
#import "MyTabBarViewController.h"
#import "HomeViewController.h"
#import "UMSocial.h"

@interface AppDelegate ()

@property (nonatomic,strong)BMKMapManager *mapManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    NSLog(@"%f",[[UIScreen mainScreen] bounds].size.height);
    MyTabBarViewController *mtb = [[MyTabBarViewController alloc] init];
    self.window.rootViewController = mtb;

    [self.window makeKeyAndVisible];
   
    
    // 要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:BaiduMapAK  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    // Add the navigation controller's view to the window and display.
//    [self.window addSubview:navigationController.view];
    
    
    
    
    [[UINavigationBar appearance] setBarTintColor:APartyColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    
    [self.window makeKeyAndVisible];
    
    [self initialUMeng];
    return YES;
    
    
}



- (void)initialUMeng {
    [UMSocialData setAppKey:kUMAppkey];
    [UMSocialWechatHandler setWXAppId:kUMWXAppId
                            appSecret:kUMWXAppSecret
                                  url:kUMShareURL];//@"http://api.yuekangsong.com/huodongpage.php"
    
    [UMSocialConfig hiddenNotInstallPlatforms:@[ UMShareToWechatSession, UMShareToWechatTimeline]];
    
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
