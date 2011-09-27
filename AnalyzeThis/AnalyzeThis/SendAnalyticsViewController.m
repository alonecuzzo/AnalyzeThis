//
//  SendAnalyticsViewController.m
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SendAnalyticsViewController.h"
#import "GANTracker.h"

static const NSInteger kGANDispatchPeriodSec = 2;
static NSString *const kGANAccountId = @"UA-25747927-1";

@implementation SendAnalyticsViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)dealloc
{
    [[GANTracker sharedTracker] stopTracker];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //set instance of tracker here
    [[GANTracker sharedTracker] startTrackerWithAccountID:kGANAccountId dispatchPeriod:kGANDispatchPeriodSec delegate:self];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Google Analytics Delegate Methods

-(void)trackerDispatchDidComplete:(GANTracker *)tracker eventsDispatched:(NSUInteger)hitsDispatched eventsFailedDispatch:(NSUInteger)hitsFailedDispatch{
    NSLog(@"events dispatched: %d, events failed: %d", hitsDispatched, hitsFailedDispatch);
}

-(void)hitDispatched:(NSString *)hitString{
    NSLog(@"HIT DISPATCHED!!!, %@", hitString);
}


#pragma mark - Button methods

-(IBAction)trackPageview:(id)sender{
    NSError *error;
    NSLog(@"tracking pageview!");
    if (![[GANTracker sharedTracker] trackPageview:@"/app_entry_point"
                                         withError:&error]) {
        NSLog(@"error in trackPageview");
    }
}

-(IBAction)trackEvent:(id)sender{
    NSLog(@"tracking event!");
    NSError *error;
    if (![[GANTracker sharedTracker] trackEvent:@"Application iPhone"
                                         action:@"Launch iPhone"
                                          label:@"Example iPhone"
                                          value:99
                                      withError:&error]) {
        NSLog(@"error in trackEvent");
    } 
}

-(IBAction)setCustomVariable:(id)sender{
    NSLog(@"setting custom variable!");
    NSError *error;
    if (![[GANTracker sharedTracker] setCustomVariableAtIndex:1
                                                         name:@"Our Custom Variable"
                                                        value:@"iv1"
                                                    withError:&error]) {
        NSLog(@"error in setCustomVariableAtIndex");
    }
}

@end
