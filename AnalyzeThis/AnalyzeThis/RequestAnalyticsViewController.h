//
//  RequestAnalyticsViewController.h
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RequestAnalyticsViewController : UIViewController {
    UIDatePicker *datePicker;
    UIDatePicker *endDatePicker;
    UIPickerView *metricsPicker;
    IBOutlet UITextField *startDateTF;
    IBOutlet UITextField *endDateTF;
}

@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UIDatePicker *endDatePicker;
@property (nonatomic, retain) UIPickerView *metricsPicker;
@property (nonatomic, retain) IBOutlet UITextField *startDateTF;
@property (nonatomic, retain) IBOutlet UITextField *endDateTF;


-(IBAction)startDateButtonPressed:(id)sender;
-(IBAction)endDateButtonPressed:(id)sender;
-(IBAction)onMetricsPress:(id)sender;
-(IBAction)onDimensionsPress:(id)sender;
-(void)translateDatePicker:(UIDatePicker *)picker isStartPicker:(BOOL)isStart showMe:(BOOL)shouldShow;

@end
