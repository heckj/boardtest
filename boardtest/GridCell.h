//
//  GridCell.h
//  boardtest
//
//  Created by Joseph Heck on 8/31/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GridCell : UIImageView

@property (strong, nonatomic) UIImage *glowImage;
@property (strong, nonatomic) CALayer *glowLayer;
@property (strong, nonatomic) CABasicAnimation *pulseAnimation;

- (void) glowOn;
- (void) glowOff;

@end
