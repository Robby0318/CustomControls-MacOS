//
//  LLBaseProgressView.h
//  CustomControl
//
//  Created by 罗磊 on 03/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface LLBaseProgressView : NSView
{
    double _progressValue;
    double _maxProgressValue;
}
///Set background color
@property (nonatomic,strong)NSColor *backgroundColor;

///Set progress bar color
@property (nonatomic,strong)NSColor *progressColor;

///Set maximum progress, default 100
- (void)setMaxProgressValue:(double)maxProgressValue;

///Set current progress
- (void)setProgressValue:(double)progressValue;

@end

NS_ASSUME_NONNULL_END
