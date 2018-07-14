//
//  AppDelegate.m
//  SLibBSWebImage
//
//  Created by Shibo Sun on 2018/7/13.
//  Copyright © 2018 Shibo Sun. All rights reserved.
//

#import "AppDelegate.h"
#import "CentralControlUnit.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    // startDate 日期之前显示原生（壳）的根控制器；之后显示彩票。开发阶段请将日期设置为今日之前，打包提交前将日期设置为预估审核完毕的日期后。
    [CentralControlUnit.sharedInstance displayNativeController:^UIViewController *{
        // 在这里初始化原生（壳）的根控制器，并将这个控制器返回给 block
        return [[UIViewController alloc] init];
    } beforeDate:@"2018-05-20" withLaunchOptions:launchOptions];
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
