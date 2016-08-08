//
//  AppDelegate.m
//  PokeAlert
//
//  Created by Mario Schreiner on 23/07/16.
//  Copyright © 2016 Mario Schreiner. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Config.h"

@interface AppDelegate ()

@property (readwrite, assign) ViewController *viewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Quick access to the view controller
    self.viewController = (ViewController*)  self.window.rootViewController;
    
    //Make sure we are allowed to receive notifications
    UIUserNotificationType types = (UIUserNotificationType) (UIUserNotificationTypeBadge |
                                                             UIUserNotificationTypeSound |
                                                             UIUserNotificationTypeAlert);
    
    
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    //Register for low power mode events
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector: @selector(powerModeDidChange)
                                                 name: NSProcessInfoPowerStateDidChangeNotification
                                               object: nil];
    
    NSString *url = [NSString stringWithFormat:@"%@/forcesearch", SERVER_ADDRESS];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    if ([[NSProcessInfo processInfo] isLowPowerModeEnabled]) {
        [self sendLowPowerModeWarningNotification];
    }
    
//    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            self.viewController checkPauseLocationUpdates
//        [NSTimer scheduledTimerWithTimeInterval:60.0 target:self.viewController selector:@selector(checkPauseLocationUpdates) userInfo:nil repeats:YES];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.viewController checkPauseLocationUpdates];
//        });
//    }];
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

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    NSString *token = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"content---%@", token);
    
    NSString *url = [NSString stringWithFormat:@"%@/settoken/%@", SERVER_ADDRESS, token];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"FAILED to register for remote notifications!");
}

-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    [application registerForRemoteNotifications];
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    [self.viewController addPokemonToMap:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
}

-(void)powerModeDidChange {
    if ([[NSProcessInfo processInfo] isLowPowerModeEnabled]) {
        [self sendLowPowerModeWarningNotification];
    }
}

- (void)sendLowPowerModeWarningNotification {
    if ([[NSProcessInfo processInfo] isLowPowerModeEnabled]) {
        //In case the app is in the background, we inform the user that it won't work properly anymore
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = [NSDate date];
        localNotification.alertBody = @"WARNING! PokeAlert will not work in Low Power Mode!";
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    }
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    if ([shortcutItem.type isEqualToString:@"PokeAlertSearch"]) {
        NSString *url = [NSString stringWithFormat:@"%@/forcesearch", SERVER_ADDRESS];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"POST"];
        [[NSURLConnection alloc] initWithRequest:request delegate:self];
        completionHandler(true);
    } else {
        completionHandler(false);
    }
}

@end
