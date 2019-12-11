//
//  ViewController.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ViewController.h"
#import "ASPyramidPresentor.h"
#import "Pyramid.h"
#import "Defines_model.h"
@interface ViewController ()
@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{

}
- (void)viewDidLoad {
    [super viewDidLoad];
   
}
#pragma mark - Conversations of pyramid
-(IBAction)movePyramidLeft:(id)sender{
    [_myPyramidPresentor.pyramid movementWithVector:LEFT];
    [_myPyramidPresentor setNeedsDisplay];
}
-(IBAction)movePyramidRight:(id)sender{
    [_myPyramidPresentor.pyramid movementWithVector:RIGHT];
    [_myPyramidPresentor setNeedsDisplay];
}
-(IBAction)movePyramidUp:(id)sender{
    [_myPyramidPresentor.pyramid movementWithVector:DOWN];
    [_myPyramidPresentor setNeedsDisplay];
}
-(IBAction)movePyramidDown:(id)sender{
    [_myPyramidPresentor.pyramid movementWithVector:UP];
    [_myPyramidPresentor setNeedsDisplay];
}
-(IBAction)movePyramidNearer:(id)sender{
    [_myPyramidPresentor.pyramid movementWithVector:Z_PLUS];
    [_myPyramidPresentor setNeedsDisplay];
}
-(IBAction)movePyramidFurther:(id)sender{
    [_myPyramidPresentor.pyramid movementWithVector:Z_MINUS];
    [_myPyramidPresentor setNeedsDisplay];
}

-(IBAction)rotatePyramidLeftAroundX:(id)sender{
     for(int i = 0;i<10;++i){
    [_myPyramidPresentor.pyramid rotateWithAxis:X andVector:LEFT];
    [_myPyramidPresentor setNeedsDisplay];
     }
}
-(IBAction)rotatePyramidLeftAroundY:(id)sender{
     for(int i = 0;i<10;++i){
    [_myPyramidPresentor.pyramid rotateWithAxis:Y andVector:LEFT];
    [_myPyramidPresentor setNeedsDisplay];
     }
}
-(IBAction)rotatePyramidLeftAroundZ:(id)sender{
     for(int i = 0;i<10;++i){
    [_myPyramidPresentor.pyramid rotateWithAxis:Z andVector:LEFT];
    [_myPyramidPresentor setNeedsDisplay];
     }
}
-(IBAction)rotatePyramidRightAroundX:(id)sender{
     for(int i = 0;i<10;++i){
    [_myPyramidPresentor.pyramid rotateWithAxis:X andVector:RIGHT];
    [_myPyramidPresentor setNeedsDisplay];
     }
}
-(IBAction)rotatePyramidRightAroundY:(id)sender{
     for(int i = 0;i<10;++i){
    [_myPyramidPresentor.pyramid rotateWithAxis:Y andVector:RIGHT];
    [_myPyramidPresentor setNeedsDisplay];
     }
}
-(IBAction)rotatePyramidRightAroundZ:(id)sender{
     for(int i = 0;i<10;++i){
    [_myPyramidPresentor.pyramid rotateWithAxis:Z andVector:RIGHT];
    [_myPyramidPresentor setNeedsDisplay];
     }
}
-(IBAction)makePyramidLarger:(id)sender{
    [_myPyramidPresentor.pyramid scaleWithCondition:PLUS_SIZE];
    [_myPyramidPresentor setNeedsDisplay];
}
-(IBAction)makePyramidSmaller:(id)sender{
    [_myPyramidPresentor.pyramid scaleWithCondition:MINUS_SIZE];
    [_myPyramidPresentor setNeedsDisplay];
}
@end
