//
//  TutorialIntroductionViewController.m
//  seeker1
//
//  Created by Troy Stribling on 2/24/11.
//  Copyright 2011 imaginary products. All rights reserved.
//

//-----------------------------------------------------------------------------------------------------------------------------------
#import "ViewControllerManager.h"
#import "cocos2d.h"
#import "AudioManager.h"

//-----------------------------------------------------------------------------------------------------------------------------------
#define kFEATURE_UNLOCK_LAUNCHER_EXIT_TAG       1
#define kFEATURE_UNLOCK_LAUNCHER_TUTORIAL_TAG   2

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@interface TutorialIntroductionViewController (PrivateAPI)

@end

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@implementation TutorialIntroductionViewController

//-----------------------------------------------------------------------------------------------------------------------------------
@synthesize containerView;
@synthesize featureList;
@synthesize selectedFeature;
@synthesize sectionID;

//===================================================================================================================================
#pragma mark TutorialIntroductionViewController PrivateAPI

//===================================================================================================================================
#pragma mark TutorialSectionViewController

//-----------------------------------------------------------------------------------------------------------------------------------
+ (id)inView:(UIView*)_containerView {
    TutorialIntroductionViewController* viewController = 
        [[TutorialIntroductionViewController alloc] initWithNibName:@"TutorialIntroductionViewController" bundle:nil inView:_containerView];
    return viewController;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil inView:(UIView*)_containerView {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        self.containerView = _containerView;
        self.view.frame = self.containerView.frame;
        self.featureList = [NSMutableArray arrayWithObjects:@"subroutines-unlock.png", @"times-loop-unlock.png", @"until-loop-unlock.png",
                                                            @"rover-bins-unlock.png",nil];
    }
    return self;
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)setTutorialIntroduction:(TutorialSectionID)_sectionID {
    self.sectionID = _sectionID;
    self.selectedFeature.image = [UIImage imageNamed:[self.featureList objectAtIndex:_sectionID - 1]];
}

//===================================================================================================================================
#pragma mark UIViewController

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//===================================================================================================================================
#pragma mark UIResponder

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch* touch = [touches anyObject];
    NSInteger touchTag = touch.view.tag;
    switch (touchTag) {
        case kFEATURE_UNLOCK_LAUNCHER_EXIT_TAG:
            break;
        case kFEATURE_UNLOCK_LAUNCHER_TUTORIAL_TAG:
            [[AudioManager instance] playEffect:SelectAudioEffectID];
            [[ViewControllerManager instance] showTutorialSectionView:[[CCDirector sharedDirector] openGLView] withSectionID:self.sectionID];
            break;
    }
    [self.view removeFromSuperview];
}

//-----------------------------------------------------------------------------------------------------------------------------------
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
}

@end
