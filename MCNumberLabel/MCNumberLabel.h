//
//  MCNumberLabel.h
//  MCNumberLabelDemo
//
//  Created by Matthew Cheok on 15/3/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCNumberLabel : UILabel

@property (strong, nonatomic) NSNumberFormatter *formatter;
@property (strong, nonatomic) NSNumber *value;

- (void)setValue:(NSNumber *)value animated:(BOOL)animated;
- (void)setValue:(NSNumber *)value duration:(NSTimeInterval)duration;

@end
