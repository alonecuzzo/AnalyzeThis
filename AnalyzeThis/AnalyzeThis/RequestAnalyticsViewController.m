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
@synthesize endDatePicker;
@synthesize startDateTF;
@synthesize endDateTF;
@synthesize metricsPicker;

#pragma mark - picker constants

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
    [datePicker addTarget:self action:@selector(datePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:datePicker];
    
    endDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 480, 320, 270)];
    [endDatePicker addTarget:self action:@selector(endDatePickerValueChanged) forControlEvents:UIControlEventValueChanged];
    endDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.view addSubview:endDatePicker];
    
    int daysToAdd = -30;
    NSDate *startDate = [[NSDate date] addTimeInterval:60*60*24*daysToAdd];
    datePicker.date = startDate;
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy"];
    
    //startDateTF.text = [NSString stringWithFormat:@"%@", datePicker.date];
    startDateTF.text = [format stringFromDate:datePicker.date];
    endDateTF.text = [format stringFromDate:endDatePicker.date];
        
    [datePicker release];
}

-(void)endDatePickerValueChanged {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy"];
    //startDateTF.text = [NSString stringWithFormat:@"%@", datePicker.date];
    endDateTF.text = [format stringFromDate:endDatePicker.date];
}

-(void)datePickerValueChanged {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy"];
    //startDateTF.text = [NSString stringWithFormat:@"%@", datePicker.date];
    startDateTF.text = [format stringFromDate:datePicker.date];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void)viewDidDisappear:(BOOL)animated {
    [self translateDatePicker:endDatePicker isStartPicker:NO showMe:NO];
    [self translateDatePicker:datePicker isStartPicker:YES showMe:NO];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - Button actions
-(IBAction)startDateButtonPressed:(id)sender {
    [self translateDatePicker:endDatePicker isStartPicker:NO showMe:NO];
    [self translateDatePicker:datePicker isStartPicker:YES showMe:YES];
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //hide the modal view
    [self translateDatePicker:endDatePicker isStartPicker:NO showMe:NO];
    [self translateDatePicker:datePicker isStartPicker:YES showMe:NO];
}


-(IBAction)endDateButtonPressed:(id)sender {
    [self translateDatePicker:endDatePicker isStartPicker:NO showMe:YES];
    [self translateDatePicker:datePicker isStartPicker:YES showMe:NO];
}

-(IBAction)onMetricsPress:(id)sender{
    NSLog(@"metrics"); 
}


-(IBAction)onDimensionsPress:(id)sender{
    NSLog(@"dimensions");    
}


-(void)translateDatePicker:(UIDatePicker *)picker isStartPicker:(BOOL)isStart showMe:(BOOL)shouldShow {
    
    NSString *pickerName;
    int transformMe;
    
    if(isStart == YES)
    {
        pickerName = @"datePicker";
        
    } else {
        pickerName = @"endDatePicker";
    }
    
    if(shouldShow == YES)
    {
        transformMe = -236;
    } else {
        transformMe = 236;
    }
    
    [UIView beginAnimations:pickerName context:nil];
    [UIView setAnimationDuration:0.5f];
    picker.transform = CGAffineTransformMakeTranslation(0, transformMe);
    [UIView commitAnimations];
}




@end
