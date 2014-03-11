///////////////////////////////////////////////////////////////////////////////////////
//
//  RCWMenuViewController.m
//  SpaceRun
//
//  Created by Austin Cherry on 3/11/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//
///////////////////////////////////////////////////////////////////////////////////////

#import "RCWMenuViewController.h"
#import "RCWViewController.h"
#import "RCWStarField.h"

@interface RCWMenuViewController ()

@property (nonatomic, strong) IBOutlet UISegmentedControl *difficultyChooser;
@property (nonatomic, strong) SKView *demoView;

@end

@implementation RCWMenuViewController

///////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.demoView = [[SKView alloc] initWithFrame:self.view.bounds];
    
    SKScene *scene = [[SKScene alloc] initWithSize:self.view.bounds.size];
    
    scene.backgroundColor = [SKColor blackColor];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    SKNode *starField = [RCWStarField node];
    [scene addChild:starField];
    
    [self.demoView presentScene:scene];
    
    [self.view insertSubview:self.demoView atIndex:0];
}
///////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self.demoView removeFromSuperview];
    self.demoView = nil;
}
///////////////////////////////////////////////////////////////////////////////////////
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PlayGame"]) {
        RCWViewController *gameController = segue.destinationViewController;
        gameController.easyMode = self.difficultyChooser.selectedSegmentIndex == 0;
    } else {
        NSAssert(false, @"Unknown segue identifier %@", segue.identifier);
    }
}
///////////////////////////////////////////////////////////////////////////////////////
@end
