//
//  MCNumberLabel.m
//  MCNumberLabelDemo
//
//  Created by Matthew Cheok on 15/3/14.
//  Copyright (c) 2014 Matthew Cheok. All rights reserved.
//

#import "MCNumberLabel.h"

@interface MCNumberLabel ()

@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) NSNumber *startNumber;
@property (strong, nonatomic) NSNumber *endNumber;

@property (assign, nonatomic) CFTimeInterval startTime;
@property (assign, nonatomic) NSTimeInterval duration;

@end

@implementation MCNumberLabel

- (void)dealloc {
    [self.displayLink invalidate];
}

- (void)setup {
    _formatter = [[NSNumberFormatter alloc] init];
}

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self setup];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self setup];
	}
	return self;
}

#pragma mark - Methods

- (void)animateValue {
    CGFloat progress = ([self.displayLink timestamp] - self.startTime)/self.duration;
    if (progress >= 1) {
        [self setValue:self.endNumber];
    }
    else {
        NSNumber *value = @(progress * [self.endNumber doubleValue] + (1-progress) * [self.startNumber doubleValue]);
        [super setText:[self.formatter stringFromNumber:value]];
    }
}

#pragma mark - Properties

- (void)setValue:(NSNumber *)value {
    _value = value;
    
    [self.displayLink invalidate];
    self.displayLink = nil;
    
    [super setText:[self.formatter stringFromNumber:value]];
}

- (void)setValue:(NSNumber *)value duration:(NSTimeInterval)duration {
    self.startNumber = [self.formatter numberFromString:self.text];
    self.endNumber = value;
    
    self.duration = duration;
    self.startTime = CACurrentMediaTime();
    
    [self.displayLink invalidate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateValue)];
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)setValue:(NSNumber *)value animated:(BOOL)animated {
    if (animated) {
        [self setValue:value duration:0.35];
    }
    else {
        [self setValue:value];
    }
}

@end
