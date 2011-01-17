//
//  MapScene.h
//  seeker1
//
//  Created by Troy Stribling on 11/14/10.
//  Copyright imaginary products 2010. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import "cocos2d.h"

//-----------------------------------------------------------------------------------------------------------------------------------
typedef enum tagMapItemID {
    StationMapItemID,
    SensorSiteMapItemID,
    SensorMapItemID,
    SampleMapItemID,
} MapItemID;

//-----------------------------------------------------------------------------------------------------------------------------------
typedef enum tagMapID {
    EmptyMapID,
    Terrain1MapID,
    Terrain2MapID,
    Terrain3MapID,
    Terrain4MapID,
    Terrain5MapID,
} MapID;

//-----------------------------------------------------------------------------------------------------------------------------------
@class SeekerSprite;
@class StatusDisplay;
@class TermMenuView;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface MapScene : CCLayer {
    SeekerSprite* seeker1;
    StatusDisplay* statusDisplay;
    NSMutableDictionary* startSite;
    NSMutableArray* seekerPath;
    NSInteger level;
    TermMenuView* menu;
    CGPoint screenCenter;
    CGSize tileMapSize;
    CCTMXTiledMap* tileMap;
    CCTMXLayer* mapLayer;
    CCTMXLayer* terrainLayer;
    CCTMXLayer* itemsLayer;
    CCTMXLayer* sandLayer;
    CCTMXObjectGroup* objectsLayer;
    CCSprite* crash;
    BOOL levelResetSeeker;
    BOOL levelResetMap;
    BOOL levelCrash;
    BOOL levelInitSeeker;
    BOOL levelCompleted;
    BOOL nextLevel;
}

//-----------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic, retain) SeekerSprite* seeker1;
@property (nonatomic, retain) StatusDisplay* statusDisplay;
@property (nonatomic, retain) NSMutableDictionary* startSite;
@property (nonatomic, retain) NSMutableArray* seekerPath;
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, retain) TermMenuView* menu;
@property (nonatomic, assign) CGPoint screenCenter;
@property (nonatomic, assign) CGSize tileMapSize;
@property (nonatomic, retain) CCTMXTiledMap* tileMap;
@property (nonatomic, retain) CCTMXLayer* mapLayer;
@property (nonatomic, retain) CCTMXLayer* terrainLayer;
@property (nonatomic, retain) CCTMXLayer* itemsLayer;
@property (nonatomic, retain) CCTMXLayer* sandLayer;
@property (nonatomic, retain) CCTMXObjectGroup* objectsLayer;
@property (nonatomic, assign) CCSprite* crash;
@property (nonatomic, assign) BOOL levelResetSeeker;
@property (nonatomic, assign) BOOL levelResetMap;
@property (nonatomic, assign) BOOL levelCrash;
@property (nonatomic, assign) BOOL levelInitSeeker;
@property (nonatomic, assign) BOOL levelCompleted;
@property (nonatomic, assign) BOOL nextLevel;

//-----------------------------------------------------------------------------------------------------------------------------------
+ (id)scene;
- (void)addResetTerminalItems;
- (void)addRunTerminalItems;
- (void)resetLevel;

//-----------------------------------------------------------------------------------------------------------------------------------
- (NSDictionary*)getTileProperties:(CGPoint)_point forLayer:(CCTMXLayer*)_layer;
- (CGPoint)getSeekerTile;
- (BOOL)positionIsInPlayingArea:(CGPoint)_position;
- (CGPoint)moveDelta;
- (CGPoint)nextPositionForDelta:(CGPoint)_delta;
- (CGPoint)nextPosition;

@end
