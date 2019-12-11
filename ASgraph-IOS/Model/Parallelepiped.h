//
//  Parallelepiped.h
//  Graph-MacOS
//
//  Created by Артем Шарапов on 15/08/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Point.h"
@interface ASParallelepiped : NSObject
@property (nonatomic,assign) MyPoint aPoint;
@property (nonatomic,assign) MyPoint bPoint;
@property (nonatomic,assign) MyPoint cPoint;
@property (nonatomic,assign) MyPoint dPoint;
@property (nonatomic,assign) MyPoint ePoint;
@property (nonatomic,assign) MyPoint fPoint;
@property (nonatomic,assign) MyPoint gPoint;
@property (nonatomic,assign) MyPoint hPoint;
@property (nonatomic,assign) MyPoint middle;

-(instancetype) initWithPoints:(MyPoint)aInitValue and:(MyPoint)bInitValue and:(MyPoint)cInitValue and:(MyPoint)dInitValue and:(MyPoint)eInitValue and:(MyPoint)fInitValue and:(MyPoint)gInitValue and:(MyPoint)hInitValue;//Method to initilize
//new parallelepiped with coords of his pointd
-(void)movementWithVector:(NSUInteger) vector;//Method will calculate new coords in conclusion with vector
//of movement. Example of parametr: @"Up"
-(void)scaleWithCondition:(NSUInteger)typeOfScale;//Method will calculate new coords in conclusion with
//type of change(upscale or downscale). Example of parametr: @"Up"
-(void)rotateWithAxis: (NSUInteger)kindOfAxis andVector:(NSString*) vector;//Method will choose an axis
//(x,y or z) and vector(left or right) to create a new coords to redraw parallelepiped. Example of parametrs
//@"x",@"Left"
-(void)goToZero:(BOOL)toZeroTrue orBack:(BOOL)toBackTrue;
-(MyPoint)middleCalculate;
-(NSMutableArray*)convertTo2d;

@end
