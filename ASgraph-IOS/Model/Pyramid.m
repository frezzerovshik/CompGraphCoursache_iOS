//
//  Pyramid.m
//  Graph-MacOS
//
//  Created by Артем Шарапов on 15/08/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pyramid.h"
#import "Defines_model.h"


@implementation ASPyramid{
NSInteger movement ;
CGFloat scale ;
}
static const CGFloat angle = ANGLE;
#pragma mark - Service methods
-(instancetype) initWithPoints:(MyPoint)aInitValue and:(MyPoint)bInitValue and:(MyPoint)cInitValue and:(MyPoint)dInitValue{
    self = [super init];
    if(self){
        movement = MOVEMENT;
        scale = 0;
        _aPoint = aInitValue;
        _bPoint = bInitValue;
        _cPoint = cInitValue;
        _dPoint = dInitValue;
        _middle = [self middleCalculate];
    }
    return self;
}
-(void)goToZero:(BOOL)toZeroTrue orBack:(BOOL)toBackTrue{
    if((toZeroTrue == true && toBackTrue == true)||(toBackTrue == false && toZeroTrue == false)){
        NSLog(@"Error while using method: both arguments have the same values");
        return;
    }
    MyPoint tmp = _middle;
    if(toZeroTrue == true){
        tmp.twoD.x = -_middle.twoD.x;
        tmp.twoD.y = -_middle.twoD.y;
        tmp.z = - _middle.z;
    }
    _aPoint.twoD.x+=tmp.twoD.x;
    _aPoint.twoD.y+=tmp.twoD.y;
    _aPoint.z+=tmp.z;
    _bPoint.twoD.x+=tmp.twoD.x;
    _bPoint.twoD.y+=tmp.twoD.y;
    _bPoint.z+=tmp.z;
    _cPoint.twoD.x+=tmp.twoD.x;
    _cPoint.twoD.y+=tmp.twoD.y;
    _cPoint.z+=tmp.z;
    _dPoint.twoD.x+=tmp.twoD.x;
    _dPoint.twoD.y+=tmp.twoD.y;
    _dPoint.z+=tmp.z;
}
-(MyPoint)middleCalculate{
 //Code will be here soon...Navernoye...
    MyPoint centerOfGravity;
    centerOfGravity.twoD.x = (_aPoint.twoD.x+_bPoint.twoD.x+_cPoint.twoD.x+_dPoint.twoD.x)/NUM_OF_PYRAMID_TOPS;
    centerOfGravity.twoD.y = (_aPoint.twoD.y+_bPoint.twoD.y+_cPoint.twoD.y+_dPoint.twoD.y)/NUM_OF_PYRAMID_TOPS;
    return centerOfGravity;
 }
#pragma mark - Conversion methods
-(void)movementWithVector:(NSUInteger)vector{
    if(vector == UP||vector == RIGHT||vector == Z_PLUS)
        movement = MOVEMENT;
    else
        movement = -MOVEMENT;
    if(vector == UP || vector == DOWN){
        _aPoint.twoD.y+=movement;
        _bPoint.twoD.y+=movement;
        _cPoint.twoD.y+=movement;
        _dPoint.twoD.y+=movement;
    }
    if(vector == LEFT || vector == RIGHT){
        _aPoint.twoD.x+=movement;
        _bPoint.twoD.x+=movement;
        _cPoint.twoD.x+=movement;
        _dPoint.twoD.x+=movement;
    }
    if(vector == Z_PLUS || vector == Z_MINUS){
        _aPoint.z+=movement;
        _bPoint.z+=movement;
        _cPoint.z+=movement;
        _dPoint.z+=movement;
    }
}
-(void)scaleWithCondition:(NSUInteger)condition{
    [self middleCalculate];
    [self goToZero:true orBack:false];
    if(condition == PLUS_SIZE)
        scale = UPSCALE;
    else
        scale = DOWNSCALE;
    
    _aPoint.twoD.x*=scale;
    _aPoint.twoD.y*=scale;
    _aPoint.z*=scale;
    _bPoint.twoD.x*=scale;
    _bPoint.twoD.y*=scale;
    _bPoint.z*=scale;
    _cPoint.twoD.x*=scale;
    _cPoint.twoD.y*=scale;
    _cPoint.z*=scale;
    _dPoint.twoD.x*=scale;
    _dPoint.twoD.y*=scale;
    _dPoint.z*=scale;
    [self goToZero:false orBack:true];
}
-(void)rotateWithAxis: (NSUInteger)kindOfAxis andVector:(NSUInteger) vector{
    [self middleCalculate];
    [self goToZero:true orBack:false];
    CGFloat tmp = angle;
    CGFloat buff = 0;
    if(kindOfAxis == X){
        if(vector == LEFT)
            tmp = -tmp;
        buff = _aPoint.twoD.y;
        _aPoint.twoD.y = buff*cos(tmp)+_aPoint.z*sin(tmp);
        _aPoint.z = -buff*sin(tmp)+_aPoint.z*cos(tmp);
        buff = _bPoint.twoD.y;
        _bPoint.twoD.y = buff*cos(tmp)+_bPoint.z*sin(tmp);
        _bPoint.z = -buff*sin(tmp)+_bPoint.z*cos(tmp);
        buff = _cPoint.twoD.y;
        _cPoint.twoD.y = buff*cos(tmp)+_cPoint.z*sin(tmp);
        _cPoint.z = -buff*sin(tmp)+_cPoint.z*cos(tmp);
        buff = _dPoint.twoD.y;
        _dPoint.twoD.y = buff*cos(tmp)+_dPoint.z*sin(tmp);
        _dPoint.z = -buff*sin(tmp)+_dPoint.z*cos(tmp);
    }
    if(kindOfAxis == Y){
        if(vector == LEFT)
            tmp = -tmp;
        buff = _aPoint.twoD.x;
        _aPoint.twoD.x = buff*cos(tmp)+_aPoint.z*sin(tmp);
        _aPoint.z = -buff*sin(tmp)+_aPoint.z*cos(tmp);
        buff = _bPoint.twoD.x;
        _bPoint.twoD.x = buff*cos(tmp)+_bPoint.z*sin(tmp);
        _bPoint.z = -buff*sin(tmp)+_bPoint.z*cos(tmp);
        buff = _cPoint.twoD.x;
        _cPoint.twoD.x = buff*cos(tmp)+_cPoint.z*sin(tmp);
        _cPoint.z = -buff*sin(tmp)+_cPoint.z*cos(tmp);
        buff = _dPoint.twoD.x;
        _dPoint.twoD.x = buff*cos(tmp)+_dPoint.z*sin(tmp);
        _dPoint.z = -buff*sin(tmp)+_dPoint.z*cos(tmp);
    }
    if(kindOfAxis == Z){
        if(vector == LEFT)
            tmp = -tmp;
        buff = _aPoint.twoD.x;
        _aPoint.twoD.x = buff*cos(tmp)+_aPoint.twoD.y*sin(tmp);
        _aPoint.twoD.y = -buff*sin(tmp)+_aPoint.twoD.y*cos(tmp);
        buff = _bPoint.twoD.x;
        _bPoint.twoD.x = buff*cos(tmp)+_bPoint.twoD.y*sin(tmp);
        _bPoint.twoD.y = -buff*sin(tmp)+_bPoint.twoD.y*cos(tmp);
        buff = _cPoint.twoD.x;
        _cPoint.twoD.x = buff*cos(tmp)+_cPoint.twoD.y*sin(tmp);
        _cPoint.twoD.y = -buff*sin(tmp)+_cPoint.twoD.y*cos(tmp);
        buff = _dPoint.twoD.x;
        _dPoint.twoD.x = buff*cos(tmp)+_dPoint.twoD.y*sin(tmp);
        _dPoint.twoD.y = -buff*sin(tmp)+_dPoint.twoD.y*cos(tmp);
    }
    [self goToZero:false orBack:true];
}
-(ASPyramid*)convertTo2d{
    ASPyramid* myPyramidIn2D = [[ASPyramid alloc]init ];
    MyPoint tmp;
    tmp.twoD.x = _aPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _aPoint.z);
    tmp.twoD.y = _aPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _aPoint.z);
    tmp.z = _aPoint.z;
    tmp.z -= Z_PL;
    myPyramidIn2D->_aPoint = tmp;
    tmp.twoD.x = _bPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _bPoint.z);
    tmp.twoD.y = _bPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _bPoint.z);
    tmp.z = _bPoint.z;
    tmp.z -= Z_PL;
    myPyramidIn2D->_bPoint = tmp;
    tmp.twoD.x = _cPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _cPoint.z);
    tmp.twoD.y = _cPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _cPoint.z);
    tmp.z = _cPoint.z;
    tmp.z -= Z_PL;
    myPyramidIn2D->_cPoint = tmp;
    tmp.twoD.x = _dPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _dPoint.z);
    tmp.twoD.y = _dPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _dPoint.z);
    tmp.z = _dPoint.z;
    tmp.z -= Z_PL;
    myPyramidIn2D->_dPoint = tmp;
    return myPyramidIn2D;
}
@end
