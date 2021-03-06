//
//  UserModel.h
//  seeker1
//
//  Created by Troy Stribling on 12/19/10.
//  Copyright 2010 imaginary products. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "TutorialSectionViewController.h"

//-----------------------------------------------------------------------------------------------------------------------------------

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface UserModel : NSObject {
    NSInteger pk;
    NSInteger level;
    NSInteger quadrangle;
    BOOL getStartedShown;
    BOOL subroutinesShown;
    BOOL timesLoopShown;
    BOOL untilLoopShown;
    BOOL roverBinsShown;
    double speedScaleFactor;
    BOOL audioEnabled;
    BOOL gameOver;
}

//-----------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic, assign) NSInteger pk;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, assign) NSInteger quadrangle;
@property (nonatomic, assign) BOOL getStartedShown;
@property (nonatomic, assign) BOOL subroutinesShown;
@property (nonatomic, assign) BOOL timesLoopShown;
@property (nonatomic, assign) BOOL untilLoopShown;
@property (nonatomic, assign) BOOL roverBinsShown;
@property (nonatomic, assign) double speedScaleFactor;
@property (nonatomic, assign) BOOL audioEnabled;
@property (nonatomic, assign) BOOL gameOver;

//-----------------------------------------------------------------------------------------------------------------------------------
+ (NSInteger)count;
+ (void)drop;
+ (void)create;
+ (void)destroyAll;
+ (UserModel*)findFirst;
+ (NSInteger)nextLevel;
+ (void)setLevel:(NSInteger)_level;
+ (NSInteger)level;
+ (void)setQuadrangle:(NSInteger)_quad;
+ (NSInteger)quadrangle;
+ (BOOL)isLastLevel;
+ (void)disableTutorials;
+ (void)enableTutorials;
+ (void)tutorialWasShown:(TutorialSectionID)_sectionID;
+ (BOOL)wasTutorialShown:(TutorialSectionID)_sectionID;
+ (void)setSpeedScaleFactor:(double)_fact;
+ (double)speedScaleFactor;
+ (void)setAudioEnabled:(BOOL)_enabled;
+ (BOOL)audioEnabled;
+ (BOOL)gameOver;
+ (void)insert;

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)insert;
- (void)destroy;
- (void)load;
- (void)update;
- (NSInteger)getStartedShownAsInteger;
- (void)setGetStartedShownAsInteger:(NSInteger)_value;
- (NSInteger)subroutinesShownAsInteger;
- (void)setSubroutinesShownAsInteger:(NSInteger)_value;
- (NSInteger)timesLoopShownAsInteger;
- (void)setTimesLoopShownAsInteger:(NSInteger)_value;
- (NSInteger)untilLoopShownAsInteger;
- (void)setUntilLoopShownAsInteger:(NSInteger)_value;
- (NSInteger)roverBinsShownAsInteger;
- (void)setRoverBinsShownAsInteger:(NSInteger)_value;
- (NSInteger)audioEnabledAsInteger;
- (void)setAudioEnabledAsInteger:(NSInteger)_value;
- (NSInteger)gameOverAsInteger;
- (void)setGameOverAsInteger:(NSInteger)_value;

@end
