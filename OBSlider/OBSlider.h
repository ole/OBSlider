//
//  OBSlider.h
//
//  Created by Ole Begemann on 02.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OBSlider : UISlider
{
    float scrubbingSpeed;
    CGPoint beganTrackingLocation;
}

@property (assign, readonly) float scrubbingSpeed;

@end
