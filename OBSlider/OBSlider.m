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

- (NSArray *) defaultScrubbingSpeeds;
- (NSArray *) defaultScrubbingSpeedChangePositions;

@end



@implementation OBSlider

@synthesize scrubbingSpeed;
@synthesize scrubbingSpeeds;
@synthesize scrubbingSpeedChangePositions;
@synthesize beganTrackingLocation;


- (void) dealloc
{
    self.scrubbingSpeeds = nil;
    self.scrubbingSpeedChangePositions = nil;
    [super dealloc];
}


- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.scrubbingSpeeds = [self defaultScrubbingSpeeds];
        self.scrubbingSpeedChangePositions = [self defaultScrubbingSpeedChangePositions];
        self.scrubbingSpeed = [[self.scrubbingSpeeds objectAtIndex:0] floatValue];
    }
    return self;
}



#pragma mark -
#pragma mark NSCoding

- (id) initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self != nil) 
    {
    	if ([decoder containsValueForKey:@"scrubbingSpeeds"]) {
            self.scrubbingSpeeds = [decoder decodeObjectForKey:@"scrubbingSpeeds"];
        } else {
            self.scrubbingSpeeds = [self defaultScrubbingSpeeds];
        }

        if ([decoder containsValueForKey:@"scrubbingSpeedChangePositions"]) {
            self.scrubbingSpeedChangePositions = [decoder decodeObjectForKey:@"scrubbingSpeedChangePositions"];
        } else {
            self.scrubbingSpeedChangePositions = [self defaultScrubbingSpeedChangePositions];
        }
        
        self.scrubbingSpeed = [[self.scrubbingSpeeds objectAtIndex:0] floatValue];
    }
    return self;
}


- (void) encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeFloat:self.scrubbingSpeed forKey:@"scrubbingSpeed"];
}



#pragma mark -
#pragma mark Touch tracking

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
        
        // Find the scrubbing speed that curresponds to the touch's vertical offset
        CGFloat verticalOffset = fabsf(currentLocation.y - self.beganTrackingLocation.y);
        NSUInteger scrubbingSpeedChangePosIndex = [self.scrubbingSpeedChangePositions indexOfObjectPassingTest:^(id obj, NSUInteger idx, BOOL *stop) {
            return (BOOL)(verticalOffset < [obj floatValue]);
        }];
        if (scrubbingSpeedChangePosIndex == NSNotFound) {
            scrubbingSpeedChangePosIndex = [self.scrubbingSpeeds count];
        }
        self.scrubbingSpeed = [[self.scrubbingSpeeds objectAtIndex:scrubbingSpeedChangePosIndex - 1] floatValue];
         
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
        self.scrubbingSpeed = [[self.scrubbingSpeeds objectAtIndex:0] floatValue];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}



#pragma mark -
#pragma mark Default values

// Used in -initWithFrame: and -initWithCoder:
- (NSArray *) defaultScrubbingSpeeds
{
    return [NSArray arrayWithObjects:
            [NSNumber numberWithFloat:1.0f],
            [NSNumber numberWithFloat:0.5f],
            [NSNumber numberWithFloat:0.25f],
            [NSNumber numberWithFloat:0.1f],
            nil];
}


- (NSArray *) defaultScrubbingSpeedChangePositions
{
    return [NSArray arrayWithObjects:
            [NSNumber numberWithFloat:0.0f],
            [NSNumber numberWithFloat:50.0f],
            [NSNumber numberWithFloat:100.0f],
            [NSNumber numberWithFloat:150.0f],
            nil];
}

@end
