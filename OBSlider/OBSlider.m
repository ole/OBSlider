//
//  OBSlider.m
//
//  Created by Ole Begemann on 02.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import "OBSlider.h"


@interface OBSlider ()

@property (assign, readwrite) float scrubbingSpeed;
@property (assign) CGPoint beganTrackingLocation;

@end



@implementation OBSlider

@synthesize scrubbingSpeed;
@synthesize beganTrackingLocation;


- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.scrubbingSpeed = 1.0f;
    }
    return self;
}


- (id) initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self != nil) 
    {
    	if ([decoder containsValueForKey:@"scrubbingSpeed"]) {
            self.scrubbingSpeed = [decoder decodeFloatForKey:@"scrubbingSpeed"];
        } else {
            self.scrubbingSpeed = 1.0f;
        }
    }
    return self;
}


- (void) encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeFloat:self.scrubbingSpeed forKey:@"scrubbingSpeed"];
}



- (BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    BOOL beginTracking = [super beginTrackingWithTouch:touch withEvent:event];
    if (beginTracking)
    {
        self.beganTrackingLocation = [touch locationInView:self];
    }
    return beginTracking;
}


- (BOOL) continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (self.tracking)
    {
        CGPoint previousLocation = [touch previousLocationInView:self];
        CGPoint currentLocation  = [touch locationInView:self];
        CGFloat trackingOffset = currentLocation.x - previousLocation.x;
        
        CGFloat verticalOffset = fabsf(currentLocation.y - self.beganTrackingLocation.y);
        if (verticalOffset < 50.0f) {
            self.scrubbingSpeed = 1.0f;
        } else if (verticalOffset < 100.0f) {
            self.scrubbingSpeed = 0.5f;
        } else {
            self.scrubbingSpeed = 0.1f;
        }
        
        CGRect trackRect = [self trackRectForBounds:self.bounds];
        self.value = self.value + self.scrubbingSpeed * (self.maximumValue - self.minimumValue) * (trackingOffset / trackRect.size.width);
        
        if (self.continuous) {
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
    return self.tracking;
}


- (void) endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (self.tracking) 
    {
        self.scrubbingSpeed = 1.0f;
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
