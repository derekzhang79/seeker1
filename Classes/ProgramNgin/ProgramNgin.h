//
//  ProgramNgin.h
//  seeker1
//
//  Created by Troy Stribling on 12/5/10.
//  Copyright 2010 imaginary products. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import <Foundation/Foundation.h>

//-----------------------------------------------------------------------------------------------------------------------------------
typedef enum tagProgramInstruction {
    MoveProgramInstruction,
    TurnLeftProgramInstruction,
    PutSensorProgramInstruction,
    GetSampleProgramInstruction,
    DoTimesProgramInstruction,
    DoUntilProgramInstruction,
} ProgramInstruction;

//-----------------------------------------------------------------------------------------------------------------------------------
typedef enum tagProgramPredicate {
    SensorBinIsEmptyProgramPredicate,
    SampleBinIsFullProgramPredicate,
} ProgramPredicate;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface ProgramNgin : NSObject {
    NSMutableArray* program;
    NSMutableArray* compiledProgram;
    BOOL programHalted;
    BOOL programRunning;
    NSInteger nextLine;
}

//-----------------------------------------------------------------------------------------------------------------------------------
@property (nonatomic, retain) NSMutableArray* program;
@property (nonatomic, retain) NSMutableArray* compiledProgram;
@property (nonatomic, assign) BOOL programHalted;
@property (nonatomic, assign) BOOL programRunning;
@property (nonatomic, assign) NSInteger nextLine;

//-----------------------------------------------------------------------------------------------------------------------------------
+ (ProgramNgin*)instance;
- (NSMutableArray*)getPrimitiveInstructions;
- (NSMutableArray*)getDoInstructions;
- (NSMutableArray*)getDoUntilPredicates;
- (NSMutableArray*)getSubroutines;
- (NSString*)instructionToString:(ProgramInstruction)_instruction;
- (NSString*)predicateToString:(ProgramPredicate)_predicate;
- (void)loadProgram:(NSMutableArray*)_program;
- (void)saveProgram:(NSMutableArray*)_program;
- (void)deleteProgram;
- (void)runProgram;
- (void)stopProgram;
- (void)haltProgram;
- (BOOL)programIsLoaded;
- (BOOL)programIsRunning;
- (BOOL)programIsHalted;
- (NSMutableArray*)nextInstruction;

@end
