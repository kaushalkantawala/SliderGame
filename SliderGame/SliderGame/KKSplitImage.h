//
//  KKSplitImage.h
//  SliderGame
//
//  Created by Kaushal Kantawala on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKSplitImage : UIViewController
{
    NSMutableArray* pieces;
}

@property (nonatomic, retain) NSMutableArray* pieces;

+(KKSplitImage *)sharedInstance;
@end

