//
//  LLCircleProgressView.h
//  CustomControl
//
//  Created by 罗磊 on 03/02/2021.
//  Copyright © 2021 luolei. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "LLBaseProgressView.h"

NS_ASSUME_NONNULL_BEGIN

@interface LLCircleProgressView : LLBaseProgressView
///Set loading state
@property(nonatomic,assign)BOOL loading;

@end

NS_ASSUME_NONNULL_END
