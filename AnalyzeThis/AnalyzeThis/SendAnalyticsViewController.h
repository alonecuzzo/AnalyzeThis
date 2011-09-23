//
//  SendAnalyticsViewController.h
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GANTracker.h"


@interface SendAnalyticsViewController : UIViewController <GANTrackerDelegate> {
    
}

-(IBAction)setCustomVariable:(id)sender;
-(IBAction)trackEvent:(id)sender;
-(IBAction)trackPageview:(id)sender;

@end
