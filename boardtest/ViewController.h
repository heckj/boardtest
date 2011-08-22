//
//  ViewController.h
//  boardtest
//
//  Created by Joseph Heck on 8/17/11.
//  Copyright (c) 2011 Deallus Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardGameView.h"
#import "GameBoard.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet BoardGameView *boardGameView;

-(IBAction)launchFeedback;

@end
