//
//  CustomPickerView.m
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomPickerView.h"

#define MAIN_FONT_SIZE 18
#define MIN_MAIN_FONT_SIZE 16

@implementation CustomPickerView
@synthesize  title, image, imageView;

const CGFloat kViewWidth = 300;
const CGFloat kViewHeight = 44;


+(CGFloat)viewWidth
{
    return kViewWidth;
}


+(CGFloat)viewHeight 
{
    return kViewHeight;
}

-(void)toggleCheckMark{
    if(self.imageView.hidden == YES){
        self.imageView.hidden = NO; 
    } else {
        self.imageView.hidden = YES;
    }
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0.0, 0.0, kViewWidth, kViewHeight)];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}



-(void)drawRect:(CGRect)rect{
    // draw the image and title using their draw methods
	CGFloat yCoord = (self.bounds.size.height - self.image.size.height) / 2;
	CGPoint point = CGPointMake(10.0, yCoord);
	//[self.image drawAtPoint:point];
    
    imageView = [[UIImageView alloc] initWithImage:self.image];
    [self addSubview:imageView];
	CGRect viewFrame = imageView.frame;
    viewFrame.origin.x = 10.0;
    viewFrame.origin.y = yCoord + 3;
    imageView.frame = viewFrame;
    
    imageView.hidden = YES;
    
	yCoord = (self.bounds.size.height - MAIN_FONT_SIZE) / 2;
	point = CGPointMake(10.0 + self.image.size.width + 10.0, yCoord);
	[self.title drawAtPoint:point
                   forWidth:self.bounds.size.width
                   withFont:[UIFont systemFontOfSize:MAIN_FONT_SIZE]
                minFontSize:MIN_MAIN_FONT_SIZE
             actualFontSize:NULL
              lineBreakMode:UILineBreakModeTailTruncation
         baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
}


// Enable accessibility for this view.
- (BOOL)isAccessibilityElement
{
	return YES;
}

// Return a string that describes this view.
- (NSString *)accessibilityLabel
{
	return self.title;
}

- (void)dealloc
{
	[title release];
	[image release];
	
	[super dealloc];
}

@end
