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

- (instancetype) initWithPoints:(MyPoint)aInitValue
                            and:(MyPoint)bInitValue
                            and:(MyPoint)cInitValue
                            and:(MyPoint)dInitValue;
- (void)movementWithVector:(NSUInteger)vector;
- (void)scaleWithCondition:(NSUInteger)condition;
- (void)rotateWithVector:(NSUInteger)vector;
- (void)goToZero:(BOOL)toZeroTrue orBack:(BOOL)toBackTrue;
- (MyPoint)middleCalculate;
- (ASPyramid *)convertTo2d;
@end
