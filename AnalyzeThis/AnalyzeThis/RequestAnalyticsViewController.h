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
}

@property (nonatomic, retain) UIDatePicker *datePicker;

-(IBAction)startDateButtonPressed:(id)sender;
-(IBAction)endDateButtonPressed:(id)sender;

@end
