//
//  LLButton.m
//  VirtualLocation
//
//  Created by 罗磊 on 30/12/2020.
//  Copyright © 2020 luolei. All rights reserved.
//

#import "LLButton.h"
#import "LLButtonCell.h"

@interface LLButton (){
    NSTrackingArea *_trackingArea;
    NSColor *_backgroundColor;
    NSColor *_backgroundEnterColor;
    NSColor *_backgroundDownColor;
}

@end

@implementation LLButton

- (instancetype)initWithFrame:(NSRect)frameRect {
    if (self = [super initWithFrame:frameRect]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    _backgroundColor = [NSColor colorWithRed:47/255.f green:182/255.f blue:179/255.f alpha:1];
    _backgroundEnterColor = [NSColor colorWithRed:24/255.f green:206/255.f blue:186/255.f alpha:1];
    _backgroundDownColor = [NSColor colorWithRed:26/255.f green:155/255.f blue:140/255.f alpha:1];
    _cornerRadius = 4.f;
    LLButtonCell *cell = [LLButtonCell new];
    [self setCell:cell];
    [self setBordered:NO];
    [self setWantsLayer:YES];
    self.layer.backgroundColor = _backgroundColor.CGColor;
    self.layer.cornerRadius = _cornerRadius;
}
#pragma mark Set
- (void)setTitle:(NSString *)title color:(NSColor *)textColor font:(NSFont *)font;{
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    NSUInteger len = [attrTitle length];
    NSRange range = NSMakeRange(0, len);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    [attrTitle addAttribute:NSForegroundColorAttributeName value:textColor
                      range:range];
    [attrTitle addAttribute:NSFontAttributeName value:font
                      range:range];
    
    [attrTitle addAttribute:NSParagraphStyleAttributeName value:paragraphStyle
                      range:range];
    [attrTitle fixAttributesInRange:range];
    [self.cell setFont:font];
    [self setAttributedTitle:attrTitle];
    attrTitle = nil;
    [self setNeedsDisplay:YES];
}

- (void)setBackgroundColor:(NSColor *)color forSate:(LLMouseSate)state
{
    if (state == LLMouseSate_Normal) {
        _backgroundColor = color;
    }else if (state == LLMouseSate_Enter){
        _backgroundEnterColor = color;
    }else if (state == LLMouseSate_Down){
        _backgroundDownColor = color;
    }
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}
#pragma mark - MouseEvent
- (void)mouseDown:(NSEvent *)event
{
    self.layer.backgroundColor = _backgroundDownColor.CGColor;
    [super mouseDown:event];
    self.layer.backgroundColor = _backgroundColor.CGColor;

}

- (void)mouseEntered:(NSEvent *)event
{
    self.layer.backgroundColor = _backgroundEnterColor.CGColor;
}

- (void)mouseExited:(NSEvent *)event
{
    self.layer.backgroundColor = _backgroundColor.CGColor;
}

#pragma mark - TrackingAreas
- (void)updateTrackingAreas {
    [super updateTrackingAreas];
    if (_trackingArea == nil) {
        NSTrackingAreaOptions options =  (NSTrackingActiveAlways | NSTrackingMouseEnteredAndExited | NSTrackingCursorUpdate);
        _trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds options:options owner:self userInfo:nil] ;
        [self addTrackingArea:_trackingArea];
    }
}


//- (BOOL)wantsUpdateLayer {
//    return NO;
//}

//- (void)updateLayer {
//    //changed to the width or height of a single source pixel centered at the specified location.
//    self.layer.contentsCenter = CGRectMake(0.5, 0.5, 0, 0);
//    //setImage
//    self.layer.backgroundColor = _backgroundColor.CGColor;
//    self.layer.cornerRadius = _cornerRadius;
//    self.layer.shadowColor = _backgroundColor.CGColor;
//    if (!CGSizeEqualToSize(CGSizeZero, _shadowOffset)) {
//        self.layer.masksToBounds = NO;
//        self.layer.shadowOffset = CGSizeMake(1, 2);
//        self.layer.shadowRadius = 6.f;
//        self.layer.shadowOpacity = 1;
//    }
//}

@end
