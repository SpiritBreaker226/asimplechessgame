//
//  ViewController.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-05-28.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "ViewController.h"
#import "SceneBoard.h"

#import "Class/aSimpleChessGame.h"

@implementation ViewController {
	aSimpleChessGame* boardInMemory;
}// end of imlementation

- (void)viewDidLoad {
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [SceneBoard sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
	
	// creates the board in memory in order to keep track of where all of the pieces are on the board as well as allow for
	// sinmilions done for AI and other checks if the Chess peice King is going to die
	boardInMemory = [[aSimpleChessGame alloc] init];
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
