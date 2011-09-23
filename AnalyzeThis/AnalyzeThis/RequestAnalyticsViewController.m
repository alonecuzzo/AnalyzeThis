//
//  RequestAnalyticsViewController.m
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RequestAnalyticsViewController.h"


@implementation RequestAnalyticsViewController
@synthesize datePicker;

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
    
    datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 480, 320, 270)];
    NSLog(@"date picker init");
    [self.view addSubview:datePicker];
    [datePicker release];

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


#pragma mark - Button actions
-(IBAction)startDateButtonPressed:(id)sender {
    NSLog(@"start date!");
   // [self presentModalViewController:(UIViewController *)datePicker animated:YES];
    [UIView beginAnimations:@"datePicker" context:nil];
    [UIView setAnimationDuration:0.5f];
    datePicker.transform = CGAffineTransformMakeTranslation(0, -236);
    [UIView commitAnimations];
        
}

-(IBAction)endDateButtonPressed:(id)sender {
    NSLog(@"end date!");
}

@end
