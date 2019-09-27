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
@property (strong , nonatomic) ASParallelepiped* myParallelepiped;
@property (strong , nonatomic) ASPyramid* myPyramid;
@property (strong , nonatomic) ASParallelepipedPresentor* myParallelepipedPresentor;
@property (strong , nonatomic) ASPyramidPresentor* myPyramidPresentor;
-(IBAction)goLeft:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)goRight:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)goDown:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)goUp:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)goNear:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)goFar:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)plusSize:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)minusSize:(id)sender withKindOfFigure:(NSString*)kindOf;
-(IBAction)rotateLeft:(id)sender withKindOfFigure:(NSString*)kindOf andNameOfAxis:(NSString*)axis;
-(IBAction)rotateRight:(id)sender withKindOfFigure:(NSString*)kindOf andNameOfAxis:(NSString*)axis;
@end

