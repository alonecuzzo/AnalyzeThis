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
@synthesize metricsDataSource;
@synthesize pickerViewArray;


-(CGRect)pickerFrameWithSize:(CGSize)size
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGRect pickerRect = CGRectMake(	0.0,
                                   screenRect.size.height - 42.0 - size.height,
                                   size.width,
                                   size.height);
    return pickerRect;
}


-(void)createMetricsPicker {
    metricsPicker = [[TestPicker alloc] initWithFrame:CGRectZero];
    metricsPicker.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    metricsDataSource = [[CustomPickerDataSource alloc] init];
    [metricsDataSource setRequestView:self];
    metricsPicker.dataSource = metricsDataSource;
    metricsPicker.delegate = metricsDataSource;
   // [metricsPicker addTarget:self action:@selector(metricPickerValueChanged) forControlEvents:UIControlEventTouchUpInside];
    //[metricsPicker.pickerTable 
    
    CGSize pickerSize = [metricsPicker sizeThatFits:CGSizeZero];
    metricsPicker.frame = [self pickerFrameWithSize:pickerSize];
    metricsPicker.showsSelectionIndicator = NO;
    
    [self.view addSubview:metricsPicker];
    [metricsPicker release];
}


-(void)metricPickerValueChanged {
    
}


-(void)setRequestString:(NSString *)reqString{
    NSLog(@"request string: %@", reqString);
}


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
    
    [self createMetricsPicker];
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

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
	NSString *returnStr = @"";
	return returnStr;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [pickerViewArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}



@end
