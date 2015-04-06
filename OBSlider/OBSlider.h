//
//  OBSlider.h
//
//  Created by Ole Begemann on 02.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OBSlider : UISlider

@property (assign, nonatomic, readonly) float scrubbingSpeed;
@property (strong, nonatomic) NSArray *scrubbingSpeeds;
@property (strong, nonatomic) NSArray *scrubbingSpeedChangePositions;

/**
 On iOS 7+ is a glitch when beginTrackingWithTouch:touch:withEvent is called
 Default is NO, for compatibility reasons
 */
@property (assign, nonatomic) BOOL shouldNotCallSuperOnBeginTracking;

@end
