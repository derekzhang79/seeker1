//
//  IntroTerm5Scene.m
//  seeker1
//
//  Created by Troy Stribling on 3/16/11.
//  Copyright 2011 imaginary products. All rights reserved.
//
//-----------------------------------------------------------------------------------------------------------------------------------
#import "IntroTerm5Scene.h"
#import "IntroMap3Scene.h"
#import "AnimatedSprite.h"

//-----------------------------------------------------------------------------------------------------------------------------------
#define kMAX_TAPS               2

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface IntroTerm5Scene (PrivateAPI)

- (void)touchPrompt;

@end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation IntroTerm5Scene

//-----------------------------------------------------------------------------------------------------------------------------------

//===================================================================================================================================
#pragma mark IntroTerm1Scene PrivateAPI

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)showMessage {
    switch (self.tapCounter) {
        case 1:
            self.displayedMessageSprite = [CCSprite spriteWithFile:@"term5-text-1.png"];
            break;
        case 2:
            self.displayedMessageSprite = [CCSprite spriteWithFile:@"term5-text-2.png"];
            self.readyForPrompt = YES;
            break;
    }
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    self.displayedMessageSprite.position = CGPointMake(screenSize.width/2, 10.0);
    self.displayedMessageSprite.anchorPoint = CGPointMake(0.5, 0.5);
    [self addChild:self.displayedMessageSprite];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)showPrompt {
    self.readyForPrompt = NO;
    AnimatedSprite* progSprite = [AnimatedSprite animationFromFile:@"term-run" withFrameCount:11 andDelay:0.1];
    AnimatedSprite* progSpriteSelected = [AnimatedSprite animationFromFile:@"term-run" withFrameCount:11 andDelay:0.1];
    CCMenuItemLabel* nextItem = [CCMenuItemSprite itemFromNormalSprite:progSprite selectedSprite:progSpriteSelected target:self selector:@selector(touchPrompt)];
    CCMenu* menu = [CCMenu menuWithItems:nextItem, nil];
    [menu alignItemsHorizontallyWithPadding:0.0];
    menu.position = CGPointMake(160.0, 448.0);
    menu.anchorPoint = CGPointMake(0.0, 0.0);
    [self addChild:menu z:0];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)touchPrompt {
    [[CCDirector sharedDirector] replaceScene: [IntroMap3Scene scene]];
}

//===================================================================================================================================
#pragma mark IntroTerm1Scene

//-----------------------------------------------------------------------------------------------------------------------------------
+ (id)scene {
	CCScene *scene = [CCScene node];
	IntroTerm5Scene *layer = [IntroTerm5Scene node];
	[scene addChild:layer];
	return scene;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (id)init {
	if((self=[super init])) {
        self.maxTaps = kMAX_TAPS;
        CCSprite* backgroundGrid = [CCSprite spriteWithFile:@"term-4.png"];
        backgroundGrid.anchorPoint = CGPointMake(0.0, 0.0);
        backgroundGrid.position = CGPointMake(0.0, 0.0);
        [self addChild:backgroundGrid z:-10];
        [self schedule:@selector(nextFrame:)];
    }
	return self;
}

@end
