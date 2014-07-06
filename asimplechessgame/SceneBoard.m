//
//  SceneBoard.m
//  asimplechessgame
//
//  Created by Jason Stathopulos on 2014-05-28.
//  Copyright (c) 2014 Jason Stathopulos. All rights reserved.
//

#import "SceneBoard.h"

@implementation SceneBoard

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.155 green:0.187 blue:0.14 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"PokemonGB"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
    }// end of if
	
    return self;
}// end of initWithSize()

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}// end of touchesBegan()

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}// end of update()

@end
