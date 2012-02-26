//
//  KKPiece.h
//  SliderGame
//
//  Created by Kaushal Kantawala on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKPiece : NSObject
{
    int ID;
//    float originalImageX;
//    float originalImageY;
//    float width;
//    float height;
    int boardPosition;
    UIImageView* tile;
    
}

@property (nonatomic, assign) int ID;
//@property (nonatomic, assign) float originalImageX;
//@property (nonatomic, assign) float originalImageY;
//@property (nonatomic, assign) float width;
//@property (nonatomic, assign) float height;
@property (nonatomic, assign) int boardPosition;
@property (nonatomic, retain) UIImageView* tile;
@end
