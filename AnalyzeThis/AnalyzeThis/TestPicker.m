//
//  TestPicker.m
//  AnalyzeThis
//
//  Created by Jabari Bell on 9/26/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//  Look at this for reference: http://stackoverflow.com/questions/567805/responding-to-touchesbegan-in-uipickerview-instead-of-uiview/6591975#6591975

//and this http://stackoverflow.com/questions/567805/responding-to-touchesbegan-in-uipickerview-instead-of-uiview

#import "TestPicker.h"


@implementation TestPicker

- (UIView *)getNextResponderView:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    UIView * hitTestView = [super hitTest:point withEvent:event];
    
     //NSLog(@"hit test class: %@", hitTestView);
    
//    if(hitTestView != nil) {
//        NSLog(@"hit");
//    } else {
//        NSLog(@"no");
//    }
        
    
    return ( hitTestView == self ) ? nil : hitTestView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView * hitTestView = [self getNextResponderView:touches withEvent:event];
    [hitTestView touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView * hitTestView = [self getNextResponderView:touches withEvent:event];
    [hitTestView touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView * hitTestView = [self getNextResponderView:touches withEvent:event];
    [hitTestView touchesEnded:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    UIView * hitTestView = [self getNextResponderView:touches withEvent:event];
    [hitTestView touchesCancelled:touches withEvent:event];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    return self;
}



@end
