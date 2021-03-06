//
//  IntroMap1Scene.h
//  seeker1
//
//  Created by Troy Stribling on 3/16/11.
//  Copyright 2011 imaginary products. All rights reserved.
//
//-----------------------------------------------------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import "cocos2d.h"

//-----------------------------------------------------------------------------------------------------------------------------------
@class StatusDisplay;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface IntroMap1Scene : CCLayer {
    StatusDisplay* statusDisplay;
    CCSprite* displayedMessageSprite;
    CCSprite* tapCounterMessageSprite;
    CCSprite* itemSprite;
    NSInteger counter;
    NSInteger messageDisplayedCount;;
    NSInteger tapCounter;
    BOOL acceptTouches;
}

//-----------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic, retain) StatusDisplay* statusDisplay;
@property (nonatomic, retain) CCSprite* displayedMessageSprite;
@property (nonatomic, retain) CCSprite* tapCounterMessageSprite;
@property (nonatomic, retain) CCSprite* itemSprite;
@property (nonatomic, assign) NSInteger counter;
@property (nonatomic, assign) NSInteger messageDisplayedCount;
@property (nonatomic, assign) NSInteger tapCounter;
@property (nonatomic, assign) BOOL acceptTouches;

//-----------------------------------------------------------------------------------------------------------------------------------
+ (id)scene;

@end
