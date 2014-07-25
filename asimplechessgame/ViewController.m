//
//  ViewController.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-05-28.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()
/*
 
 Private Properties
 
*/

@property (nonatomic) aSimpleChessGame* gameState;
@property (nonatomic) SceneBoard* sceneOfTheBoard;

@end

@implementation ViewController

/*
 
 Private Methods
 
*/

-(void)startChessGame {
	// adds the cells to the board
	[self.sceneOfTheBoard addChessCellsToBoard:[self.gameState createCellsOnBoard]];
	
	// clears the memory board and starts the game
	// TODO: when the SceneGameOptions is created one of the options needs to be which colour is the user
	[self.sceneOfTheBoard addChessPiecesToBoard:[self.gameState clearBoardAndSetChessColour:@"Black"]];
}// end of startChessGame

/*
 
 Events
 
*/

- (void)viewDidLoad {
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
	skView.multipleTouchEnabled = NO;
    
    // Create and configure the scene.
    self.sceneOfTheBoard = [SceneBoard sceneWithSize:skView.bounds.size];
    self.sceneOfTheBoard.scaleMode = SKSceneScaleModeAspectFill;
    
	// creates the board in memory in order to keep track of where all of the pieces are on the board as well as allow for
	// sinmilions done for AI and other checks if the Chess peice King is going to die
	self.gameState = [[aSimpleChessGame alloc] init];
	
	// loads the game state into the sceneOfTheBoard
	self.sceneOfTheBoard.gameState = self.gameState;
	
    // Present the scene.
    [skView presentScene:self.sceneOfTheBoard];
	
	// loads the game on to the sceen
	[self startChessGame];
}// end of viewDidLoad()

// turns off the status bar in code
-(BOOL)prefersStatusBarHidden {
	return YES;
}//end of prefersStatusBarHidden()

- (BOOL)shouldAutorotate {
    return YES;
}// end of shouldAutorotate()

- (NSUInteger)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        return UIInterfaceOrientationMaskAllButUpsideDown;
	else
        return UIInterfaceOrientationMaskAll;
}// end of supportedInterfaceOrientations()

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}// end of didReceiveMemoryWarning()

@end
