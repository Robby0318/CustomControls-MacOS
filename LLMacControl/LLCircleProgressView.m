//
//  LLCircleProgressView.m
//  CustomControl
//
//  Created by 罗磊 on 03/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import "LLCircleProgressView.h"
#import <Quartz/Quartz.h>
#import "NSBezierPath+LLExtends.h"
#import "CALayer+Animation.h"
@interface LLCircleProgressView ()
{
    CAShapeLayer *_lowovalLayer;
    CAShapeLayer *_fillovalLayer; 
    CALayer *_bglayer;
}
@end


@implementation LLCircleProgressView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initConfig];
}
- (void)initConfig{
    [self setWantsLayer:YES];
    [self.layer setFrame:NSRectToCGRect(self.frame)];
    _bglayer = [CALayer layer];
    [_bglayer setFrame:NSRectToCGRect(self.frame)];
    [_bglayer setPosition:CGPointMake(NSWidth(self.frame)/2.0, NSHeight(self.frame)/2.0)];
    [self.layer addSublayer:_bglayer];
    _lowovalLayer = [[CAShapeLayer alloc] init];
    _lowovalLayer.frame = CGRectMake(0, 0, NSWidth(_bglayer.frame), NSWidth(_bglayer.frame));
    _lowovalLayer.strokeColor = self.backgroundColor.CGColor;
    _lowovalLayer.fillColor = [NSColor clearColor].CGColor;
    _lowovalLayer.lineWidth = 5;
    NSBezierPath *lowPath = [NSBezierPath bezierPath];
    [lowPath appendBezierPathWithArcWithCenter:NSMakePoint(NSWidth(_bglayer.frame)/2.0, NSWidth(_bglayer.frame)/2.0) radius:NSWidth(_bglayer.frame)/2.0 - _lowovalLayer.lineWidth startAngle:90 endAngle:-270 clockwise:YES];
    _lowovalLayer.path = lowPath.CGPath;
    _lowovalLayer.lineCap = kCALineCapRound;
    _lowovalLayer.lineJoin = kCALineJoinRound;

    _fillovalLayer = [[CAShapeLayer alloc] init];
    _fillovalLayer.frame = CGRectMake(0, 0, NSWidth(_bglayer.frame), NSWidth(_bglayer.frame));
    _fillovalLayer.lineWidth = 5;
    NSBezierPath *fillPath = [NSBezierPath bezierPath];
    [fillPath appendBezierPathWithArcWithCenter:NSMakePoint(NSWidth(_bglayer.frame)/2.0, NSWidth(_bglayer.frame)/2.0) radius:NSWidth(_bglayer.frame)/2.0 - _fillovalLayer.lineWidth  startAngle:90 endAngle:-270 clockwise:YES];
    _fillovalLayer.strokeColor = self.progressColor.CGColor;
    _fillovalLayer.fillColor = [NSColor clearColor].CGColor;
    _fillovalLayer.path = fillPath.CGPath;
    _fillovalLayer.lineCap = kCALineCapRound;
    _fillovalLayer.lineJoin = kCALineJoinRound;
    _fillovalLayer.strokeEnd = 0.0;
    [_bglayer addSublayer:_lowovalLayer];
    [_bglayer addSublayer:_fillovalLayer];
}


- (void)setLoading:(BOOL)loading
{
    if (loading) {
        [self startAnimation];
    }else{
        [self stopAnimation];
    }
}

- (void)startAnimation
{
    _fillovalLayer.strokeEnd = 0.25;
    [_fillovalLayer animateKey:@"transform.rotation.z"  fromValue:@0 toValue:@(-2*M_PI) customize:^(CABasicAnimation *animation) {
        animation.repeatCount = NSIntegerMax;
        animation.duration = 2.0;
        animation.additive = YES;
    }];
}

- (void)stopAnimation
{
    [_fillovalLayer removeAllAnimations];
}

#pragma mark - Set
- (void)setProgressValue:(double)progressValue
{
    CGFloat angle = progressValue/_maxProgressValue;
    _fillovalLayer.strokeEnd = angle;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    _lowovalLayer.strokeColor = self.backgroundColor.CGColor;

}

- (void)setProgressColor:(NSColor *)progressColor
{
    [super setProgressColor:progressColor];
    _fillovalLayer.strokeColor = self.progressColor.CGColor;
}

@end
