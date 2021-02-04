//
//  LLBaseProgressView.m
//  CustomControl
//
//  Created by 罗磊 on 03/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import "LLBaseProgressView.h"

@implementation LLBaseProgressView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    _progressColor = [NSColor blueColor];
    _backgroundColor = [NSColor grayColor];
    _maxProgressValue = 100.0;
}

- (void)setMaxProgressValue:(double)maxProgressValue
{
    _maxProgressValue = maxProgressValue;
}

- (void)setProgressValue:(double)progressValue
{
    _progressValue = progressValue;
}

@end
