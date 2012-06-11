//
//  OBSliderDemoViewController.m
//  OBSliderDemo
//
//  Created by Ole Begemann on 03.01.11.
//  Copyright 2011 Ole Begemann. All rights reserved.
//

#import "OBSliderDemoViewController.h"
#import "OBSlider.h"

@interface OBSliderDemoViewController ()

- (void)updateUI;

@end


@implementation OBSliderDemoViewController

@synthesize slider = _slider;
@synthesize sliderValueLabel = _sliderValueLabel;
@synthesize scrubbingSpeedLabel = _scrubbingSpeedLabel;

- (void)viewDidLoad 
{
    [super viewDidLoad];
}

- (void)viewDidUnload 
{
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.slider = nil;
    self.sliderValueLabel = nil;
    self.scrubbingSpeedLabel = nil;
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
                                     [percentFormatter stringFromNumber:[NSNumber numberWithFloat:self.slider.scrubbingSpeed]]];
}

- (IBAction)sliderValueDidChange:(id)sender
{
    [self updateUI];
}

@end
