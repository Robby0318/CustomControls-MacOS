//
//  LLSwitchButton.h
//  VirtualLocation
//
//  Created by 罗磊 on 30/12/2020.
//  Copyright © 2020 luolei. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLSwitchButton : NSControl

///Set switch state
@property (nonatomic, setter = setOn:) BOOL isOn;

///Set the tintcolor in the on state
@property (nonatomic, strong) NSColor *tintColor;

///Set the tintcolor in the off state
@property (nonatomic, strong) NSColor *noTintColor;

///Set the tintBordercolor in the off state
@property (nonatomic, strong) NSColor *noTintBorderColor;
@end

NS_ASSUME_NONNULL_END
