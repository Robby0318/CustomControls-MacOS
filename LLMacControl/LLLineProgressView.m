//
//  LLProgressView.m
//  CustomControl
//
//  Created by 罗磊 on 03/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import "LLLineProgressView.h"
#import "NSBezierPath+LLExtends.h"

@interface LLLineProgressView ()
{
    CGFloat _height;
    CALayer *_progressLayer;
    CALayer *_bgprogressLayer;
}
@end

@implementation LLLineProgressView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self initConfig];
    }
    return self;
}


- (void)awakeFromNib
{
    _height = NSHeight(self.frame);
    [self initConfig];
}

- (void)initConfig
{
    [self setWantsLayer:YES];
    self.layer.frame = NSRectToCGRect(self.frame);
    _bgprogressLayer = [CALayer layer];
    [_bgprogressLayer setAnchorPoint:CGPointMake(0, 0)];
    [_bgprogressLayer setFrame:NSRectToCGRect(self.bounds)];
    _bgprogressLayer.cornerRadius = NSHeight(self.bounds) * 0.5;
    _bgprogressLayer.backgroundColor = self.backgroundColor.CGColor;
    [self.layer addSublayer:_bgprogressLayer];
    _progressLayer = [CALayer layer];
    [_progressLayer setAnchorPoint:CGPointMake(0, 0)];
    [_progressLayer setFrame:NSRectToCGRect(self.bounds)];
    [_progressLayer setPosition:CGPointMake(NSWidth(self.bounds)/2.0, NSHeight(self.bounds)/2.0)];
    _progressLayer.cornerRadius = NSHeight(self.bounds) * 0.5;
    _progressLayer.backgroundColor = self.progressColor.CGColor;
    [_bgprogressLayer addSublayer:_progressLayer];
    if (NSHeight(self.frame) == 0) {
        _height = 6;
    }else{
        _height = NSHeight(self.frame);
    }
    [self setProgressValue:0.0];
}

#pragma mark - Set
- (void)setProgressValue:(double)progressValue
{
    float p = progressValue/_maxProgressValue;
    _progressLayer.frame = CGRectMake(0, 0, NSWidth(self.frame) * p, NSHeight(self.frame));
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    _bgprogressLayer.backgroundColor = self.backgroundColor.CGColor;

}

- (void)setProgressColor:(NSColor *)progressColor
{
    [super setProgressColor:progressColor];
    _progressLayer.backgroundColor = self.progressColor.CGColor;
}

@end
