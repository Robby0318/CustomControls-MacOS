//
//  LLButton.h
//  VirtualLocation
//
//  Created by 罗磊 on 30/12/2020.
//  Copyright © 2020 luolei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
typedef NS_ENUM(NSInteger,LLMouseSate) {
    LLMouseSate_Normal,
    LLMouseSate_Enter,
    LLMouseSate_Down,
};
NS_ASSUME_NONNULL_BEGIN

@interface LLButton : NSButton

/// Set button radius
@property(nonatomic,assign)CGFloat cornerRadius;

///Set button text, text color, text font
- (void)setTitle:(NSString *)title color:(NSColor *)textColor font:(NSFont *)font;

///Set the background color of buttons in different states
- (void)setBackgroundColor:(NSColor *)color forSate:(LLMouseSate)state;
@end

NS_ASSUME_NONNULL_END
