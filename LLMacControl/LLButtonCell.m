//
//  LLButtonCell.m
//  VirtualLocation
//
//  Created by 罗磊 on 30/12/2020.
//  Copyright © 2020 luolei. All rights reserved.
//

#import "LLButtonCell.h"

@implementation LLButtonCell
- (instancetype)init {
    self = [super init];
    [self setHighlightsBy:NSNoCellMask];
    return self;
}

- (NSSize)cellSize
{
    CGSize size = [super cellSize];
    return size;
}

- (NSSize)cellSizeForBounds:(NSRect)rect {
    CGSize cellSize = [super cellSizeForBounds:rect];
    return cellSize;
}

- (NSRect)titleRectForBounds:(NSRect)rect {
    CGFloat lineH1 = self.font.leading - self.font.descender +self.font.ascender;
    CGFloat y = 0.5 * (NSHeight(rect) - lineH1);
    NSRect titleRect = NSMakeRect(NSMinX(rect), y, NSWidth(rect), lineH1);
    return titleRect;
}

- (NSRect)drawTitle:(NSAttributedString *)title withFrame:(NSRect)frame inView:(NSView *)controlView {
    NSRect titleRect = [super drawTitle:title withFrame:frame inView:controlView];
    return titleRect;
}
- (void)highlight:(BOOL)flag withFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    [super highlight:flag withFrame:cellFrame inView:controlView];
}

- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    [super drawInteriorWithFrame:cellFrame inView:controlView];
}

@end
