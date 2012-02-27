//
//  KKBoard.h
//  SliderGame
//
//  Created by Kaushal Kantawala on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKPiece.h"

typedef enum
{
    LEFT = 1,
    TOP,
    RIGHT,
    DOWN
} direction;

@interface KKBoard : UIViewController
{
    NSMutableArray* pieceViews;
    NSMutableDictionary* pieces;
}

@property (nonatomic, retain) NSMutableArray* pieceViews;
@property (nonatomic, retain) NSMutableDictionary* pieces;


+(KKBoard *) sharedInstance;
- (void) shuffleBoard;
- (void) updatePositions;
- (void) checkCompletion;
- (NSMutableArray *) verticalMovablePieces;
- (NSMutableArray *) horizontalMovablePieces;
- (void) printPositions;
- (void) tap:(UITapGestureRecognizer *)sender;
- (int) directionAvailableForMove:(UIImageView *) tile;
- (void) moveTile:(UIImageView *) tile inDirection: (int) direction;

@end
