//
//  ViewController.h
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASParallelepiped;
@class ASPyramid;
@class ASPyramidPresentor;
@class ASParallelepipedPresentor;
@interface ViewController : UIViewController

@property (strong , nonatomic) IBOutlet ASParallelepipedPresentor* myParallelepipedPresentor;
@property (strong , nonatomic) IBOutlet ASPyramidPresentor* myPyramidPresentor;
#pragma mark - Conversations of pyramid
-(IBAction)movePyramidLeft:(id)sender;
-(IBAction)movePyramidRight:(id)sender;
-(IBAction)movePyramidUp:(id)sender;
-(IBAction)movePyramidDown:(id)sender;
-(IBAction)movePyramidNearer:(id)sender;
-(IBAction)movePyramidFurther:(id)sender;

-(IBAction)rotatePyramidLeftAroundX:(id)sender;
-(IBAction)rotatePyramidLeftAroundY:(id)sender;
-(IBAction)rotatePyramidLeftAroundZ:(id)sender;
-(IBAction)rotatePyramidRightAroundX:(id)sender;
-(IBAction)rotatePyramidRightAroundY:(id)sender;
-(IBAction)rotatePyramidRightAroundZ:(id)sender;

-(IBAction)makePyramidLarger:(id)sender;
-(IBAction)makePyramidSmaller:(id)sender;
#pragma mark - Conversations of parallelepiped
-(IBAction)moveParallelepipedLeft:(id)sender;
-(IBAction)moveParallelepipedRight:(id)sender;
-(IBAction)moveParallelepipedUp:(id)sender;
-(IBAction)moveParallelepipedDown:(id)sender;
-(IBAction)moveParallelepipedNearer:(id)sender;
-(IBAction)moveParallelepipedFurther:(id)sender;

-(IBAction)rotateParallelepipedLeftAroundX:(id)sender;
-(IBAction)rotateParallelepipedLeftAroundY:(id)sender;
-(IBAction)rotateParallelepipedLeftAroundZ:(id)sender;
-(IBAction)rotateParallelepipedRightAroundX:(id)sender;
-(IBAction)rotateParallelepipedRightAroundY:(id)sender;
-(IBAction)rotateParallelepipedRightAroundZ:(id)sender;

-(IBAction)makeParallelepipedLarger:(id)sender;
-(IBAction)makeParallelepipedSmaller:(id)sender;


@end

