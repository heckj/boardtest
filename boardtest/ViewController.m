    //
    //  ViewController.m
    //  boardtest
    //
    //  Created by Joseph Heck on 8/17/11.
    //  Copyright (c) 2011 Deallus Software. All rights reserved.
    //

#import "ViewController.h"

@implementation ViewController
@synthesize boardGameView;

/*
 *   app -> gameboard
 * BoardViewController -> BoardGameView -> UIImageView Array (gridcells) for board
 *                              |      \-> UIImageView Array (boardpieces) for pieces
 *                              +--> touches logic
 */

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setBoardGameView:nil];
    [super viewDidUnload];
        // Release any retained subviews of the main view.
        // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    GameBoard *gb = [[GameBoard alloc] init];
    [gb boardStart];
    [self.boardGameView initializePieces:gb];
        //    [self.boardGameView logViewStrucure];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
        // Return YES for supported orientations
        //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        //        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
        //    } else {
        //        return YES;
        //    }
}

#pragma mark - UI Actions

- (IBAction)DoThatMoveThing:(id)sender {
        //
}

-(IBAction)launchFeedback {
    [TestFlight openFeedbackView];
}

@end
