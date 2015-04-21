//
//  OBSliderDemoViewController.m
//  OBSliderDemo
//
//  Created by Ole Begemann on 03.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import "OBSliderDemoViewController.h"
#import "OBSlider.h"

@implementation OBSliderDemoViewController

- (void)viewDidLoad 
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateUI];
}

- (void)updateUI
{
    NSNumberFormatter *percentFormatter = [[NSNumberFormatter alloc] init];
    [percentFormatter setNumberStyle:NSNumberFormatterPercentStyle];
    
    self.sliderValueLabel.text = [NSString stringWithFormat:@"Value: %.0f", self.slider.value];
    self.scrubbingSpeedLabel.text = [NSString stringWithFormat:@"Scrubbing speed: %@",
                                     [percentFormatter stringFromNumber:@(self.slider.scrubbingSpeed)]];
}

- (IBAction)sliderValueDidChange:(id)sender
{
    [self updateUI];
}

@end
