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
    double _progressValue;
    double _maxProgressValue;

}
@end

@implementation LLLineProgressView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        [self setUp];
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (!self) return nil;
    [self setUp];
    return self;
}

- (void)awakeFromNib
{
    _height = NSHeight(self.frame);
}

- (void)setUp
{
    _maxProgressValue = 100.0;
    self.backgroundColor = [NSColor grayColor];
    self.leftFillColor = [NSColor colorWithDeviceRed:1.0/255 green:150.0/255 blue:235.0/255 alpha:1.0];
    self.rightFillColor = [NSColor colorWithDeviceRed:115.0/255 green:204.0/255 blue:255.0/255 alpha:1.0];
    [self setProgressValue:50.0];
    _height = 6;
}

- (void)setMaxProgressValue:(double)maxProgressValue
{
    _maxProgressValue = maxProgressValue;
}


- (void)setProgressValue:(double)pgressValue
{
    _progressValue = pgressValue;
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
    NSRect slideRect = dirtyRect;
    slideRect.size.height = _height;
    NSBezierPath *bpath = [NSBezierPath bezierPathWithRoundedRect:slideRect xRadius:_height/2 yRadius:_height/2];
    [_backgroundColor set];
    [bpath addClip];
    [bpath fill];
    slideRect.size.width = slideRect.size.width*_progressValue/_maxProgressValue;
    NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:slideRect xRadius:_height/2 yRadius:_height/2];
    CGContextRef context = [[NSGraphicsContext currentContext] CGContext];
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    if (_progressValue !=0) {
        CGContextAddPath(context, [path CGPath]);
        CGContextClip(context);
        CGContextSaveGState(context);
        {
            const CGFloat glossGradientComponents[] = {_leftFillColor.redComponent,_leftFillColor.greenComponent,_leftFillColor.blueComponent, 1.0f, _rightFillColor.redComponent, _rightFillColor.greenComponent, _rightFillColor.blueComponent, 1.0f};
            const CGFloat glossGradientLocations[] = {0.2,1.0};
            //创建颜色渐变对象
            CGGradientRef glossCradient = CGGradientCreateWithColorComponents(colorSpace, glossGradientComponents, glossGradientLocations, 2);
            CGContextDrawLinearGradient(context, glossCradient, CGPointMake(slideRect.origin.x, slideRect.origin.y), CGPointMake(slideRect.origin.x + slideRect.size.width, slideRect.size.height), kCGGradientDrawsAfterEndLocation);
            CGGradientRelease(glossCradient);
            
        }
        CGContextRestoreGState(context);
    }
    CGColorSpaceRelease(colorSpace);
}

@end
