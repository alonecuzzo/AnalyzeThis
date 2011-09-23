//
//  AnalyzeThisAppDelegate.m
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnalyzeThisAppDelegate.h"
#import "GANTracker.h"

@implementation AnalyzeThisAppDelegate

static const NSInteger kGANDispatchPeriodSec = 2;
static NSString *const kGANAccountId = @"UA-25747927-1";

@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    NSLog(@"HEY");
    
    [[GANTracker sharedTracker] startTrackerWithAccountID:kGANAccountId dispatchPeriod:kGANDispatchPeriodSec delegate:self];
    
    NSError *error;
    if (![[GANTracker sharedTracker] setCustomVariableAtIndex:1
                                                         name:@"iPhone1"
                                                        value:@"iv1"
                                                    withError:&error]) {
        NSLog(@"error in setCustomVariableAtIndex");
    }
    
    if (![[GANTracker sharedTracker] trackEvent:@"Application iPhone"
                                         action:@"Launch iPhone"
                                          label:@"Example iPhone"
                                          value:99
                                      withError:&error]) {
        NSLog(@"error in trackEvent");
    } else {
        NSLog(@"should be working!");
    }
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - delegate methods

-(void)trackerDispatchDidComplete:(GANTracker *)tracker eventsDispatched:(NSUInteger)hitsDispatched eventsFailedDispatch:(NSUInteger)hitsFailedDispatch{
    NSLog(@"events dispatched: %d, events failed: %d", hitsDispatched, hitsFailedDispatch);
}

-(void)hitDispatched:(NSString *)hitString{
    NSLog(@"HIT DISPATCHED!!!, %@", hitString);
}


#pragma mark - ui methods

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
