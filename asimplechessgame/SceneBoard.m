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
        
        self.backgroundColor = [UIColor colorWithRed:155/255.0f green:187/255.0f blue:14/255.0f alpha:1.0f];
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
