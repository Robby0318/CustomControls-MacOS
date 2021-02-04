//
//  CALayer+Animation.m
//  MacClean
//
//  Created by LuoLei on 15-12-9.
//  Copyright (c) 2015年 imobie. All rights reserved.
//

#import "CALayer+Animation.h"

@implementation CALayer (Animation)

- (void)animateKey:(NSString *)animationName fromValue:(id)fromValue toValue:(id)toValue
         customize:(void (^)(CABasicAnimation *animation))block
{
    [self setValue:toValue forKey:animationName];
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:animationName];
    anim.fromValue = fromValue ?: [self.presentationLayer valueForKey:animationName];
    anim.toValue = toValue;
    if (block) block(anim);
    [self addAnimation:anim forKey:animationName];
}

@end
