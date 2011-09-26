//
//  CustomPickerDataSource.m
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomPickerDataSource.h"
#import "CustomPickerView.h"


@implementation CustomPickerDataSource
@synthesize customPickerArray;


- (NSArray *)dimensionNames {
    return [NSArray arrayWithObjects:
            @"ga:browser", @"ga:browserVersion", @"ga:city",
            @"ga:connectionSpeed", @"ga:continent", @"ga:visitCount",
            @"ga:country", @"ga:date", @"ga:day", @"ga:daysSinceLastVisit",
            @"ga:flashVersion", @"ga:hostname", @"ga:hour", @"ga:javaEnabled",
            @"ga:language", @"ga:latitude", @"ga:longitude", @"ga:month",
            @"ga:networkDomain", @"ga:networkLocation", @"ga:pageDepth",
            @"ga:operatingSystem", @"ga:operatingSystemVersion", @"ga:region",
            @"ga:screenColors", @"ga:screenResolution", @"ga:subContinent",
            @"ga:userDefinedValue", @"ga:visitLength", @"ga:visitorType",
            @"ga:week", @"ga:year", @"ga:adContent", @"ga:adGroup", @"ga:adSlot",
            @"ga:adSlotPosition", @"ga:campaign", @"ga:keyword", @"ga:medium",
            @"ga:referralPath", @"ga:source", @"ga:exitPagePath",
            @"ga:landingPagePath",  @"ga:secondPagePath", @"ga:pagePath",
            @"ga:pageTitle", @"ga:affiliation", @"ga:daysToTransaction",
            @"ga:productCategory", @"ga:productName", @"ga:productSku",
            @"ga:transactionId", @"ga:searchCategory",
            @"ga:searchDestinationPage", @"ga:searchKeyword",
            @"ga:searchKeywordRefinement", @"ga:searchStartPage",
            @"ga:searchUsed", @"ga:nextPagePath", @"ga:previousPagePath",
            @"ga:eventCategory", @"ga:eventAction", @"ga:eventLabel", nil];
}

- (NSArray *)metricNames {
    return [NSArray arrayWithObjects:
            @"ga:adClicks", @"ga:adCost", @"ga:bounces ", @"ga:CPC", @"ga:CPM",
            @"ga:CTR", @"ga:entrances", @"ga:exits", @"ga:goal1Completions",
            @"ga:goal1Starts", @"ga:goal1Value", @"ga:goal2Completions",
            @"ga:goal2Starts", @"ga:goal2Value", @"ga:goal3Completions",
            @"ga:goal3Starts", @"ga:goal3Value", @"ga:goal4Completions",
            @"ga:goal4Starts", @"ga:goal4Value", @"ga:goalCompletionsAll",
            @"ga:goalStartsAll", @"ga:goalValueAll", @"ga:impressions",
            @"ga:itemQuantity", @"ga:itemRevenue", @"ga:newVisits",
            @"ga:pageviews", @"ga:searchDepth", @"ga:searchDuration",
            @"ga:searchExits", @"ga:searchRefinements", @"ga:searchUniques",
            @"ga:searchVisits", @"ga:timeOnPage", @"ga:timeOnSite",
            @"ga:transactionRevenue", @"ga:transactions",
            @"ga:transactionShipping", @"ga:transactionTax",
            @"ga:uniquePageviews", @"ga:uniquePurchases",
            @"ga:visitors", @"ga:visits",
            @"ga:totalEvents", @"ga:uniqueEvents", @"ga:eventValue", nil];
}


- (id)init
{
	// use predetermined frame size
	self = [super init];
	if (self)
	{
		// create the data source for this custom picker
		NSMutableArray *viewArray = [[NSMutableArray alloc] init];
        
        for (CustomPickerView *view in self.metricNames) {
            
        }
        
        
//		CustomView *earlyMorningView = [[CustomView alloc] initWithFrame:CGRectZero];
//		earlyMorningView.title = @"Early Morning";
//		earlyMorningView.image = [UIImage imageNamed:@"12-6AM.png"];
//		[viewArray addObject:earlyMorningView];
//		[earlyMorningView release];
//        
//		CustomView *lateMorningView = [[CustomView alloc] initWithFrame:CGRectZero];
//		lateMorningView.title = @"Late Morning";
//		lateMorningView.image = [UIImage imageNamed:@"6-12AM.png"];
//		[viewArray addObject:lateMorningView];
//		[lateMorningView release];
//        
//		CustomView *afternoonView = [[CustomView alloc] initWithFrame:CGRectZero];
//		afternoonView.title = @"Afternoon";
//		afternoonView.image = [UIImage imageNamed:@"12-6PM.png"];
//		[viewArray addObject:afternoonView];
//		[afternoonView release];
//        
//		CustomView *eveningView = [[CustomView alloc] initWithFrame:CGRectZero];
//		eveningView.title = @"Evening";
//		eveningView.image = [UIImage imageNamed:@"6-12PM.png"];
//		[viewArray addObject:eveningView];
//		[eveningView release];
        
		self.customPickerArray = viewArray;
		[viewArray release];
	}
	return self;
}

@end
