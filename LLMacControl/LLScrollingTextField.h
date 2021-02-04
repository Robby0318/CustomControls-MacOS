//
//  LLScrollingTextField.h
//  CustomControl
//
//  Created by 罗磊 on 04/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLScrollingTextField : NSTextField<CAAnimationDelegate>

///Set scroll rate
@property (nonatomic, assign)  CGFloat scrollingRate;

///Set scroll Offset
@property (nonatomic, assign)  CGFloat scrollingOffset;
@end

NS_ASSUME_NONNULL_END
