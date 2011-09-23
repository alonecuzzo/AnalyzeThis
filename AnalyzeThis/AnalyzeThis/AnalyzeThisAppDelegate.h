//
//  AnalyzeThisAppDelegate.h
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GANTracker.h"

@interface AnalyzeThisAppDelegate : NSObject <UIApplicationDelegate, GANTrackerDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
