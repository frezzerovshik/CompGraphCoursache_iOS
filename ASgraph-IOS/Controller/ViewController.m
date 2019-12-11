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
-(IBAction) goLeft:(id)sender withKindOfFigure:(NSString *)kindOf{
    for(int i = 0;i<10;++i){
    [_myPyramidPresentor.pyramid rotateWithAxis:Z andVector:LEFT];
    [_myPyramidPresentor setNeedsDisplay];
    }
}
-(IBAction) plusSize:(id)sender withKindOfFigure:(NSString *)kindOf{
    
    [_myPyramidPresentor.pyramid scaleWithCondition:1];
    [_myPyramidPresentor setNeedsDisplay];
}
@end
