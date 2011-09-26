//
//  CustomPickerDataSource.h
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CustomPickerDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray	*customPickerArray;
}

@property (nonatomic, retain) NSArray *customPickerArray;

@end
