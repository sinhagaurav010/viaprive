//
//  AppDelegate.h
//  viaprive
//
//  Created by preet dhillon on 30/03/12.
//  Copyright (c) 2012 dhillon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    HomeViewController *HomeController;
}
@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic)    HomeViewController *HomeController;
@property(strong,nonatomic)    UINavigationController *navigation;

@end
