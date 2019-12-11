//
//  Pyramid.h
//  Graph-MacOS
//
//  Created by Артем Шарапов on 15/08/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Point.h"

@interface ASPyramid : NSObject

@property (nonatomic,assign) MyPoint aPoint;
@property (nonatomic,assign) MyPoint bPoint;
@property (nonatomic,assign) MyPoint cPoint;
@property (nonatomic,assign) MyPoint dPoint;
@property (nonatomic,assign) MyPoint middle;

-(instancetype) initWithPoints:(MyPoint)aInitValue and:(MyPoint)bInitValue and:(MyPoint)cInitValue and:(MyPoint)dInitValue;//Method //to initilize new parallelepiped with coords of his pointd
-(void)movementWithCondition:(NSUInteger) vector;//Method will calculate new coords in conclusion with vector
//of movement. Example of parametr: @"Up"
-(void)scaleWithCondition:(NSUInteger) type;//Method will calculate new coords in conclusion with
//type of change(upscale or downscale). Example of parametr: @"Up"
-(void)rotateWithAxis: (NSUInteger)kindOfAxis andVector:(NSUInteger) vector;//Method will choose an axis
//(x,y or z) and vector(left or right) to create a new coords to redraw parallelepiped. Example of parametrs
//@"x",@"Left"
-(void)goToZero:(BOOL)toZeroTrue orBack:(BOOL)toBackTrue;
-(MyPoint)middleCalculate;
-(ASPyramid* )convertTo2d;
@end
