//
//  ASPyramidPresentor.h
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASPyramid;
@interface ASPyramidPresentor : UIView

//Конструктор из мяса и костей
-(instancetype)initWithExample: (ASPyramid*) example andView:(UIView*)myView;
#pragma mark - building methods
-(void) buildFrame;
-(void) buildPyramidOnView;
-(void) deletePyramid;
-(void) deleteInvizibleLines;
-(void) drawZbuffer;
#pragma mark - colorful methods
-(void) fillingFigureWithColor: (UIColor*) color;
-(void) buildShadow;
@end
