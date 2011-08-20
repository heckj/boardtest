//
//  ViewController.h
//  boardtest
//
//  Created by Joseph Heck on 8/17/11.
//  Copyright (c) 2011 Nebula, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardGameView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet BoardGameView *boardGameView;

-(IBAction)launchFeedback;

@end
