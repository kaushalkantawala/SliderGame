//
//  KKBoard.m
//  SliderGame
//
//  Created by Kaushal Kantawala on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KKBoard.h"
#import "KKPiece.h"

@implementation KKBoard

@synthesize pieceViews;
@synthesize positions;
@synthesize pieces;

+(KKBoard *) sharedInstance
{
    static KKBoard* imgInstance = nil;
    if (imgInstance == nil)
    {
        imgInstance = [[KKBoard alloc] init];
    }
    return imgInstance;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        pieceViews = [NSMutableArray arrayWithCapacity:15];
        pieces = [NSMutableArray arrayWithCapacity:15];
//        for (int i=0; i<15; i++)
//        {
//            UIView* pieceView = [[UIView alloc] init];
//            [pieceViews insertObject:pieceView atIndex:i];
//        }
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void) loadView
{
    UIView *root = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 650, 650)];
    root.backgroundColor = [UIColor darkGrayColor];
    UIImage* whole = [UIImage imageNamed:@"UIE_Slider_Puzzle--globe.jpg"];
    int partId = 0;
    for (int y=0; y<=405; y+=135) {
        for (int x=0; x<=405; x+=135) {
            
            CGImageRef cgImg = CGImageCreateWithImageInRect(whole.CGImage, CGRectMake(x, y, 135, 135));
            UIImage* part = [UIImage imageWithCGImage:cgImg];
//            UIImageView* iv = [[UIImageView alloc] initWithImage:part];
            
            UIImageView* sView = [[UIImageView alloc] initWithFrame:CGRectMake((partId%4 * 162), (partId/4 * 162), 160, 160)];
            sView.image = part;
            sView.contentMode = UIViewContentModeScaleAspectFit;
//            [sView addSubview:iv];
            
            [pieceViews addObject:sView];
            
//            [iv release];
            
            KKPiece* p = [[KKPiece alloc] init];
            p.ID = partId;
            p.originalImageX = x;
            p.originalImageY = y;
            p.width = 140;
            p.height = 140;
//            This will need to change
            p.boardPosition = x*4 + y;
            [pieces addObject:p];

            
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(tap:)];
            tap.numberOfTapsRequired = 1;
            [sView addGestureRecognizer:tap];
            [tap release];
            
            sView.tag = partId;
            
            [root addSubview:sView];
//            [sView release];
            partId++;
            CGImageRelease(cgImg);
        }
    }
    UIImageView* removedView = [pieceViews objectAtIndex:15];
    [removedView removeFromSuperview];
    self.view = root;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
