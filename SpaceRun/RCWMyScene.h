///////////////////////////////////////////////////////////////////////////////////////
//
//  RCWMyScene.h
//  SpaceRun
//
//  Copyright (c) 2014 Vluxe. All rights reserved.
//
///////////////////////////////////////////////////////////////////////////////////////

#import <SpriteKit/SpriteKit.h>

@interface RCWMyScene : SKScene

@property (nonatomic, copy) dispatch_block_t endGameCallback;
@property (nonatomic) BOOL easyMode;

@end
