//
//  NSBezierPath+LLKitExtends.m
//  VirtualLocation
//
//  Created by 罗磊 on 30/12/2020.
//  Copyright © 2020 luolei. All rights reserved.
//

#import "NSBezierPath+LLExtends.h"

@implementation NSBezierPath (LLExtends)
- (CGPathRef)CGPath {
    CGMutablePathRef cgPath = CGPathCreateMutable();
    NSInteger n = self.elementCount;
    if (n <= 0) {
        return nil;
    }
    NSPoint ps[3];
    for (NSInteger i = 0; i < n; i++) {
        NSBezierPathElement element = [self elementAtIndex:i associatedPoints:ps];
        switch (element) {
            case NSBezierPathElementMoveTo:
            {
                CGPathMoveToPoint(cgPath, NULL, ps[0].x, ps[0].y);
            }
            break;
            case NSBezierPathElementLineTo:
                CGPathAddLineToPoint(cgPath, NULL, ps[0].x, ps[0].y);
            break;
            case NSBezierPathElementCurveTo:
                CGPathAddCurveToPoint(cgPath, NULL, ps[0].x, ps[0].y, ps[1].x, ps[1].y, ps[2].x, ps[2].y);
            break;
            case NSBezierPathElementClosePath:
                CGPathCloseSubpath(cgPath);
            break;
        }
    }
    return CFAutorelease(cgPath);
}
@end
