//
//  KKSplitImage.m
//  SliderGame
//
//  Created by Kaushal Kantawala on 2/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KKSplitImage.h"

@implementation KKSplitImage

@synthesize pieces;

+(KKSplitImage *) sharedInstance
{
    static KKSplitImage* imgInstance = nil;
    if (imgInstance == nil)
    {
        imgInstance = [[KKSplitImage alloc] init];
    }
    return imgInstance;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        pieces = [NSMutableArray arrayWithCapacity:15];
        for (int i=0; i<15; i++)
        {
            UIView* piece = [[UIView alloc] init];
            [pieces insertObject:piece atIndex:i];
        }
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

//- (void)loadView {
//    UIView *root = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 560, 560)];
//    UIImage* whole = [UIImage imageNamed:@"UIE_Slider_Puzzle--globe.jpg"];
//    
//    int partId = 0;
//    for (int x=0; x<=400; x+=139.42) {
//        for(int y=0; y<=400; y+=139.42) {
//            CGImageRef cgImg = CGImageCreateWithImageInRect(whole.CGImage, CGRectMake(x, y, 139.42, 139.42));
//            UIImage* part = [UIImage imageWithCGImage:cgImg];
//            UIImageView* iv = [[UIImageView alloc] initWithImage:part];
//            
//            UIView* sView = [[UIView alloc] initWithFrame:CGRectMake(400-x, 400-y, 160, 160)];
//            [sView addSubview:iv];
//            [iv release];
//            
//            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                                  action:@selector(tap:)];
//            tap.numberOfTapsRequired = 1;
//            [sView addGestureRecognizer:tap];
//            [tap release];
//            
//            sView.tag = partId;
//            
//            [root addSubview:sView];
//            [sView release];
//            partId++;
//            CGImageRelease(cgImg);
//        }
//    }
//    
//    self.view = root;
//}

//-(void) loadView
//{
//    UIView *root = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 640, 640)];
//    root.backgroundColor = [UIColor darkGrayColor];
//    UIImage* whole = [UIImage imageNamed:@"UIE_Slider_Puzzle--globe.jpg"];
//    int partId = 0;
//    for (int x=0; x<=400; x+=140) {
//        for (int y=0; y<=400; y+=140) {
//    
//            CGImageRef cgImg = CGImageCreateWithImageInRect(whole.CGImage, CGRectMake(x, y, 140, 140));
//            UIImage* part = [UIImage imageWithCGImage:cgImg];
//            UIImageView* iv = [[UIImageView alloc] initWithImage:part];
//
////            UIView* sView = [[UIView alloc] initWithFrame:CGRectMake(x, y, 140, 140)];
//            
//            pieces[partId] = [[UIView alloc] initWithFrame:CGRectMake(x, y, 140, 140)];
//            
//            [sView addSubview:iv];
//            [iv release];
//
//            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                                  action:@selector(tap:)];
//            tap.numberOfTapsRequired = 1;
//            [sView addGestureRecognizer:tap];
//            [tap release];
//
//            sView.tag = partId;
//
//            [root addSubview:sView];
//            [sView release];
//            partId++;
//            CGImageRelease(cgImg);
//        }
//    }
//    self.view = root;
//}

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
