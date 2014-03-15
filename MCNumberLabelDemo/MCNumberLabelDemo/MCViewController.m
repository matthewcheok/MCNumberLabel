//
//  MCViewController.m
//  MCNumberLabelDemo
//
//  Created by Matthew Cheok on 15/3/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCViewController.h"
#import "MCNumberLabel.h"

@import CoreText;

@interface MCViewController ()

@property (weak, nonatomic) IBOutlet MCNumberLabel *numberLabel;

@end

@implementation MCViewController

#pragma mark - Methods

- (IBAction)handleFirstButton:(id)sender {
	[self.numberLabel setValue:@(10) animated:YES];
}

- (IBAction)handleSecondButton:(id)sender {
	[self.numberLabel setValue:@(100) animated:YES];
}

- (IBAction)handleThirdButton:(id)sender {
	[self.numberLabel setValue:@(1000) animated:YES];
}

- (IBAction)handleFourthButton:(id)sender {
	[self.numberLabel setValue:@(10000) animated:YES];
}

#pragma mark - UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    // use proportional spaced fonts
	UIFont *const existingFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
	UIFontDescriptor *const existingDescriptor = [existingFont fontDescriptor];

	NSDictionary *const fontAttributes = @{
		// Here comes that array of dictionaries each containing UIFontFeatureTypeIdentifierKey
		// and UIFontFeatureSelectorIdentifierKey that the reference mentions.
		UIFontDescriptorFeatureSettingsAttribute: @[
		    @{
		        UIFontFeatureTypeIdentifierKey: @(kNumberSpacingType),
		        UIFontFeatureSelectorIdentifierKey: @(kProportionalNumbersSelector)
			},
		    @{
		        UIFontFeatureTypeIdentifierKey: @(kCharacterAlternativesType),
		        UIFontFeatureSelectorIdentifierKey: @(1)
			}]
	};

	UIFontDescriptor *const proportionalDescriptor = [existingDescriptor fontDescriptorByAddingAttributes:fontAttributes];
	UIFont *const proportionalFont = [UIFont fontWithDescriptor:proportionalDescriptor size:64];
    self.numberLabel.font = proportionalFont;

    // thousands separator
	self.numberLabel.formatter.usesGroupingSeparator = YES;
	self.numberLabel.formatter.groupingSeparator = @",";
	self.numberLabel.formatter.groupingSize = 3;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
