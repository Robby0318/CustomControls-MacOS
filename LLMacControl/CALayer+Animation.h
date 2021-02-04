//
//  CALayer+Animation.h
//  MacClean
//
//  Created by LuoLei on 15-12-9.
//  Copyright (c) 2015年 imobie. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Animation)
- (void)animateKey:(NSString *)animationName fromValue:(id)fromValue toValue:(id)toValue
         customize:(void (^)(CABasicAnimation *animation))block;

@end
