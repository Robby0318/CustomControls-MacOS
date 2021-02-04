//
//  LLCheckBoxButton.m
//  CustomControl
//
//  Created by 罗磊 on 03/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import "LLCheckBoxButton.h"

@implementation LLCheckBoxButton

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

- (void)setup
{
    NSButtonCell *cell = self.cell;
    cell.imageScaling = NSImageScaleProportionallyUpOrDown;
    [cell setButtonType:NSButtonTypeSwitch];
    [cell setBordered:NO];
    [self setButtonType:NSButtonTypeSwitch];
    [self setState:NSControlStateValueOff];
}

- (void)setState:(NSControlStateValue)value
{
    if (value == NSControlStateValueOn) {
        [self setImage:[NSImage imageNamed:@"sel_all"]];
    }
    else if(value == NSControlStateValueOff){
        [self setImage:[NSImage imageNamed:@"sel_non"]];
    }
    else if(value == NSControlStateValueMixed){
        [self setImage:[NSImage imageNamed:@"sel_sem"]];
    }
    [super setState:value];
}

- (void)mouseDown:(NSEvent *)theEvent{
    if (![self isEnabled]) {
        return;
    }
    if (self.allowsMixedState) {
        if (self.state == NSControlStateValueOn) {
            self.state = NSControlStateValueOff;
        }else if (self.state == NSControlStateValueOff){
            [self setState:NSControlStateValueMixed];
        }else{
            [self setState:NSControlStateValueOn];
        }
    }else{
        if (self.state == NSControlStateValueMixed) {
            self.state = NSControlStateValueOn;
        }else{
            [self setState:self.state == NSControlStateValueOn?NSControlStateValueOff:NSControlStateValueOn];
        }
    }
    [NSApp sendAction:self.action to:self.target from:self];
}


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
