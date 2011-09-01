//
//  GridCell.m
//  boardtest
//
//  Created by Joseph Heck on 8/31/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import "GridCell.h"

@implementation GridCell

@synthesize glowImage;
@synthesize glowLayer;
@synthesize pulseAnimation;

- (void) glowOn {
    if (self.glowImage == nil) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            self.glowImage = [UIImage imageNamed:@"gloweffect_iphone.png"];
        } else {
            self.glowImage = [UIImage imageNamed:@"gloweffect_ipad.png"];
        }
    }
    if (self.glowLayer == nil) {
        self.glowLayer = [CALayer layer];
        self.glowLayer.contents = (id)[self.glowImage CGImage];
        self.glowLayer.frame = CGRectInset(self.layer.bounds, 0, 0);
        self.glowLayer.opacity = 0;
        [self.layer addSublayer:self.glowLayer];
    }
    if (self.pulseAnimation == nil) {
        self.pulseAnimation =[CABasicAnimation animationWithKeyPath:@"opacity"];
        pulseAnimation.duration = 1;
        pulseAnimation.fromValue = [NSNumber numberWithFloat:0.0];
        pulseAnimation.toValue = [NSNumber numberWithFloat:1.0];
        pulseAnimation.delegate = self;
        pulseAnimation.autoreverses = YES;
        pulseAnimation.repeatCount = 4000; // really big number...
        pulseAnimation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
        
    }
    
    [self.glowLayer addAnimation:pulseAnimation forKey:@"pulseAnimation"];
}

- (void) glowOff {
    [self.glowLayer removeAllAnimations];
    self.glowLayer.opacity = 0;
    self.glowImage = nil;
}

@end
