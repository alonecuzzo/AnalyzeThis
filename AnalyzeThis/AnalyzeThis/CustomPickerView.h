//
//  CustomPickerView.h
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomPickerView : UIView {
    NSString *title;
    UIImage *image;
    UIImageView *imageView;
    BOOL isHidden;
    
    @private
        int tTitle;
}

@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) UIImage *image;
@property(nonatomic, retain) UIImageView *imageView;
@property(nonatomic, assign) BOOL isHidden;

-(void)toggleCheckMark;
-(BOOL)getCheckMarkVisibility;
-(int)toggleTitle;
-(int)getTitleToggle;

+ (CGFloat)viewWidth;
+ (CGFloat)viewHeight;

@end
