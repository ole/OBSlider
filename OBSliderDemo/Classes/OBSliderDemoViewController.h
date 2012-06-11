//
//  OBSliderDemoViewController.h
//  OBSliderDemo
//
//  Created by Ole Begemann on 03.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OBSlider;

@interface OBSliderDemoViewController : UIViewController 

@property (weak, nonatomic) IBOutlet OBSlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *scrubbingSpeedLabel;

- (IBAction)sliderValueDidChange:(id)sender;

@end

