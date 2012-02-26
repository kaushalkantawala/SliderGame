//
//  KKBoard.h
//  SliderGame
//
//  Created by Kaushal Kantawala on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKPiece.h"

@interface KKBoard : UIViewController
{
    NSMutableArray* pieceViews;
    NSMutableArray* positions;
    NSMutableArray* pieces;
}

@property (nonatomic, retain) NSMutableArray* pieceViews;
@property (nonatomic, retain) NSMutableArray* pieces;
@property (nonatomic, retain) NSMutableArray* positions;

+(KKBoard *) sharedInstance;


@end
