MCNumberLabel
=====================

Drop-in label control with the ability to animate digits.


##Screenshot
![Screenshot](https://raw.github.com/matthewcheok/MCNumberLabel/master/screenshot.gif "Example of MCNumberLabel")

## Installation

Add the following to your [CocoaPods](http://cocoapods.org/) Podfile

    pod 'MCNumberLabel'

or clone as a git submodule,

or just copy files in the ```MCNumberLabel``` folder into your project.

## Using MCNumberLabel

Simply call methods `-setValue:animated:` or `-setValue:duration:` to animate digits.

    [self.numberLabel setValue:@(100) animated:YES];

or

    [self.numberLabel setValue:@(100) duration:0.5];

## Configuring the NSNumberFormatter

You can specify more granular options for displaying numbers using the `formatter` property on MCNumberLabel.

An example for configuring a thousands separator is as follows:

    self.numberLabel.formatter.usesGroupingSeparator = YES;
    self.numberLabel.formatter.groupingSeparator = @",";
    self.numberLabel.formatter.groupingSize = 3;

## Using Proportional Numbers

You can present more readable digits by using proportional numbers. The following snippet from WWDC 2013 Session 223 would configure such fonts:

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

## License

MCNumberLabel is under the MIT license.
