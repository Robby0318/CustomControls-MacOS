//
//  LLTextView.m
//  CustomControl
//
//  Created by 罗磊 on 04/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import "LLTextView.h"

@implementation LLTextView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    // Drawing code here.
}

-(void)awakeFromNib
{
    NSScrollView *scrollView = (NSScrollView *)[[self superview] superview];
     NSDictionary *fontDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:self.textStorage.font.fontName size:self.textStorage.font.pointSize ],NSFontAttributeName,nil];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:self.textStorage.string attributes:fontDic];
    [self.textStorage setAttributedString:str];
    [self setFrameSize:NSMakeSize(str.size.width+self.textContainer.lineFragmentPadding*2, self.frame.size.height)];
    [scrollView scrollClipView:nil toPoint:NSMakePoint(0, 0)];
}

- (void)mouseMoved:(NSEvent *)theEvent
{
    NSPoint point = [[[self superview] superview] convertPoint:[theEvent locationInWindow] fromView:nil];
    NSPoint point1 = point;
    NSView *documentView = ((NSScrollView *)([[self superview] superview])).documentView;
    NSScrollView *scrollView = (NSScrollView *)[[self superview] superview];
    float x = (documentView.frame.size.width - scrollView.frame.size.width)/(scrollView.frame.size.width*1.0);
    point.x = point.x*x;
    if (point.x + [[[self superview] superview] frame].size.width<[documentView frame].size.width) {
        [scrollView scrollClipView:nil toPoint:point];
        point1.x = point1.x + point.x;
        NSInteger charIndex = [self characterIndexForInsertionAtPoint:point1];
        NSRange range = [self getCusoruRange:charIndex];
        if (range.length + range.location-1<=self.textStorage.length) {
            [self.textStorage removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, self.textStorage.length)];
            [self.textStorage addAttribute:NSForegroundColorAttributeName value:[NSColor blueColor] range:range];
        }
    }
}

- (void)mouseExited:(NSEvent *)theEvent
{
    [self.textStorage removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, self.textStorage.length)];
}


- (NSRange)getCusoruRange:(NSInteger)charindex
{
    NSRange range;
    NSMutableArray *leftArray = [NSMutableArray array];
    NSMutableArray *rightArray = [NSMutableArray array];
    for (int i=0;i<self.string.length;i++) {
        NSString *subStr = [self.string substringWithRange:NSMakeRange(i, 1)];
        if ([subStr isEqualToString:@"/"]&&i<charindex) {
            [leftArray addObject:[NSNumber numberWithInt:i]];
        }else if ([subStr isEqualToString:@"/"]&&i>charindex)
        {
             [rightArray addObject:[NSNumber numberWithInt:i]];
        }
    }
    if ([leftArray count]>0) {
        range.location = [[leftArray lastObject] intValue] + 1;
    }
    if ([rightArray count]>0) {
        range.length = [[rightArray objectAtIndex:0] intValue] - range.location;
    }else
    {
       range.length = self.string.length - [[leftArray lastObject] intValue] - 1;
    }
    return range;
}

@end
