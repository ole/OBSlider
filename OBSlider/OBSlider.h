//
//  OBSlider.h
//
//  Created by Ole Begemann on 02.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OBSlider : UISlider

@property (atomic, assign, readonly) float scrubbingSpeed;
@property (atomic, retain) NSArray *scrubbingSpeeds;
@property (atomic, retain) NSArray *scrubbingSpeedChangePositions;

@end
