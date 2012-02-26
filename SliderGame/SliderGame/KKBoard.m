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
@synthesize pieces;

static int positions[16] = {-1};

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
        pieceViews = [NSMutableArray arrayWithCapacity:16];
        pieces = [NSMutableDictionary dictionaryWithCapacity:16];
        NSMutableArray* tempArray = [NSMutableArray arrayWithCapacity:16];
        NSMutableDictionary* tempPieces = [NSMutableDictionary dictionaryWithCapacity:16];
        for (int i=0; i<16; i++)
        {
            UIImageView* pieceView = [[UIImageView alloc] initWithFrame:CGRectMake((i%4*162), (i/4*162), 160, 160)];
            [tempArray addObject:pieceView];
            KKPiece* piece = [[[KKPiece alloc] init]retain];
            piece.ID = i+1;
            piece.boardPosition = i+1;
            [tempPieces setObject:piece forKey:[NSString stringWithFormat:@"%d",(i+1)]
             ];
        }
        pieceViews = [tempArray retain];
        pieces = [tempPieces retain];
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
    int partId = 1;
    for (int y=0; y<=405; y+=135) {
        for (int x=0; x<=405; x+=135) {
            
            CGImageRef cgImg = CGImageCreateWithImageInRect(whole.CGImage, CGRectMake(x, y, 135, 135));
            UIImage* part = [UIImage imageWithCGImage:cgImg];            
            UIImageView* sView = [pieceViews objectAtIndex:partId-1];
            sView.image = part;
            sView.contentMode = UIViewContentModeScaleAspectFit;
            sView.tag = partId;
            KKPiece* piece = [pieces objectForKey:[NSString stringWithFormat:@"%d",partId]];
            piece.ID = partId;
            piece.boardPosition = partId;
            piece.tile = sView;
            UILabel* idLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
            idLabel.textColor = [UIColor whiteColor];
            idLabel.backgroundColor = [UIColor blackColor];
            idLabel.textAlignment = UITextAlignmentCenter;
            idLabel.text = [NSString stringWithFormat:@"%d",sView.tag];
            [sView addSubview:idLabel];
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
            tap.numberOfTapsRequired = 1;
            [sView setUserInteractionEnabled:YES];
            [sView addGestureRecognizer:tap];
            [tap release];
                        
            [root addSubview:sView];
            partId++;
            CGImageRelease(cgImg);
        }
    }
    UIImageView* removedView = [pieceViews objectAtIndex:15];
    [removedView removeFromSuperview];
    self.view = root;
}

- (void) shuffleBoard
{
    static BOOL seeded = NO;
    if(!seeded)
    {
        seeded = YES;
        srandom(time(NULL));
    }
    
    NSUInteger count = [pieceViews count];
    NSLog(@"Count: %d",count);
    
    for (NSUInteger i = 0; i < count; ++i) {
        int nElements = count - i;
        int n = (random() % nElements) + i;
//        NSLog(@"%d, %d",i,n);
        UIImageView *pieceView1 = [pieceViews objectAtIndex:i];
        pieceView1.frame = CGRectMake((n%4 * 162), (n/4 * 162), 160, 160);
//        KKPiece* piece1 = [pieces objectForKey:[NSString stringWithFormat:@"%d",i]];
//        piece1.boardPosition = n;
        UIImageView *pieceView2 = [pieceViews objectAtIndex:n];
        pieceView2.frame = CGRectMake((i%4 * 162), (i/4 * 162), 160, 160);
//        KKPiece* piece2 = [pieces objectForKey:[NSString stringWithFormat:@"%d",n]];
//        piece2.boardPosition = i;
//        NSLog(@"%d %f %f %d %f %f",i,pieceView1.frame.origin.x, pieceView1.frame.origin.y, n, pieceView2.frame.origin.x, pieceView2.frame.origin.y);    
        [pieceViews exchangeObjectAtIndex:i withObjectAtIndex:n];

    }

    [pieceViews retain];
    [self printPositions];
    [self updatePositions];
}

- (void) tap:(UITapGestureRecognizer *)sender
{
    NSLog(@"Image View Tag: %d",sender.view.tag);
}

- (void) updatePositions
{
    int i =0;
    for (UIImageView* pieceView in pieceViews)
    {
        KKPiece* piece = [pieces objectForKey:[NSString stringWithFormat:@"%d",(i+1)]];
        piece.boardPosition = pieceView.tag;
        NSLog(@"ID = %d   bP = %d", piece.ID, piece.boardPosition);
        i++;
    }
}

- (void) printPositions
{
    for (UIImageView* pieceView in pieceViews)
    {
        NSLog(@"tag = %d", pieceView.tag);   
    }
    for (id key in pieces)
    {
        KKPiece* piece = [pieces objectForKey:key];
        NSLog(@"key = %@  ID = %d  boardPosition = %d",key, piece.ID, piece.boardPosition);
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self shuffleBoard];
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
