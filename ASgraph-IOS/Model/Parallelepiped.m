//
//  Parallelepiped.m
//  Graph-MacOS
//
//  Created by Артем Шарапов on 15/08/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Parallelepiped.h"
#import "Defines_model.h"
#define Z_PL -50
#define Z_C -500
@implementation ASParallelepiped{
NSInteger movement ;
    CGFloat scale;
}
static const CGFloat angle = 0.02;
#pragma mark - Service methods
-(instancetype) initWithPoints:(MyPoint)aInitValue and:(MyPoint)bInitValue and:(MyPoint)cInitValue and:(MyPoint)dInitValue and:(MyPoint)eInitValue and:(MyPoint)fInitValue and:(MyPoint)gInitValue and:(MyPoint)hInitValue{
    self = [super init];
    if(self){
        _aPoint = aInitValue;
        _bPoint = bInitValue;
        _cPoint = cInitValue;
        _dPoint = dInitValue;
        _ePoint = eInitValue;
        _fPoint = fInitValue;
        _gPoint = gInitValue;
        _hPoint = hInitValue;
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
    _ePoint.twoD.x+=tmp.twoD.x;
    _ePoint.twoD.y+=tmp.twoD.y;
    _ePoint.z+=tmp.z;
    _fPoint.twoD.x+=tmp.twoD.x;
    _fPoint.twoD.y+=tmp.twoD.y;
    _fPoint.z+=tmp.z;
    _gPoint.twoD.x+=tmp.twoD.x;
    _gPoint.twoD.y+=tmp.twoD.y;
    _gPoint.z+=tmp.z;
    _hPoint.twoD.x+=tmp.twoD.x;
    _hPoint.twoD.y+=tmp.twoD.y;
    _hPoint.z+=tmp.z;
}
/*-(MyPoint)middleCalculate{
    //Code will be here soon...Navernoye...
}*/
#pragma mark - Conversion methods
-(void)movementWithVector:(NSUInteger)vector{
    if(vector == UP || vector == RIGHT || vector == Z_PLUS)
        movement = 5;
    else
        movement = -5;
    if(vector == UP||vector == DOWN){
        _aPoint.twoD.y+=movement;
        _bPoint.twoD.y+=movement;
        _cPoint.twoD.y+=movement;
        _dPoint.twoD.y+=movement;
        _ePoint.twoD.y+=movement;
        _fPoint.twoD.y+=movement;
        _gPoint.twoD.y+=movement;
        _hPoint.twoD.y+=movement;
    }
    if(vector == LEFT||vector == RIGHT){
        _aPoint.twoD.x+=movement;
        _bPoint.twoD.x+=movement;
        _cPoint.twoD.x+=movement;
        _dPoint.twoD.x+=movement;
        _ePoint.twoD.x+=movement;
        _fPoint.twoD.x+=movement;
        _gPoint.twoD.x+=movement;
        _hPoint.twoD.x+=movement;
    }
    if(vector == Z_PLUS||vector == Z_MINUS){
        _aPoint.z+=movement;
        _bPoint.z+=movement;
        _cPoint.z+=movement;
        _dPoint.z+=movement;
        _ePoint.z+=movement;
        _fPoint.z+=movement;
        _gPoint.z+=movement;
        _hPoint.z+=movement;
    }
  }
-(void)scaleWithCondition:(NSUInteger)typeOfScale{
    [self middleCalculate];
    [self goToZero:true orBack:false];
    if(typeOfScale == PLUS_SIZE)
        scale = 1.2;
    else
        scale = 0.7;
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
    _ePoint.twoD.x*=scale;
    _ePoint.twoD.y*=scale;
    _ePoint.z*=scale;
    _fPoint.twoD.x*=scale;
    _fPoint.twoD.y*=scale;
    _fPoint.z*=scale;
    _gPoint.twoD.x*=scale;
    _gPoint.twoD.y*=scale;
    _gPoint.z*=scale;
    _hPoint.twoD.x*=scale;
    _hPoint.twoD.y*=scale;
    _hPoint.z*=scale;
    [self goToZero:false orBack:true];
}
-(void)rotateWithAxis: (NSUInteger)kindOfAxis andVector:(NSUInteger) vector{
//Code will be soon too...
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
        buff = _ePoint.twoD.y;
        _ePoint.twoD.y = buff*cos(tmp)+_ePoint.z*sin(tmp);
        _ePoint.z = -buff*sin(tmp)+_ePoint.z*cos(tmp);
        buff = _fPoint.twoD.y;
        _fPoint.twoD.y = buff*cos(tmp)+_fPoint.z*sin(tmp);
        _fPoint.z = -buff*sin(tmp)+_fPoint.z*cos(tmp);
        buff = _gPoint.twoD.y;
        _gPoint.twoD.y = buff*cos(tmp)+_gPoint.z*sin(tmp);
        _gPoint.z = -buff*sin(tmp)+_gPoint.z*cos(tmp);
        buff = _hPoint.twoD.y;
        _hPoint.twoD.y = buff*cos(tmp)+_hPoint.z*sin(tmp);
        _hPoint.z = -buff*sin(tmp)+_hPoint.z*cos(tmp);
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
        buff = _ePoint.twoD.x;
        _ePoint.twoD.x = buff*cos(tmp)+_ePoint.z*sin(tmp);
        _ePoint.z = -buff*sin(tmp)+_ePoint.z*cos(tmp);
        buff = _fPoint.twoD.x;
        _fPoint.twoD.x = buff*cos(tmp)+_fPoint.z*sin(tmp);
        _fPoint.z = -buff*sin(tmp)+_fPoint.z*cos(tmp);
        buff = _gPoint.twoD.x;
        _gPoint.twoD.x = buff*cos(tmp)+_gPoint.z*sin(tmp);
        _gPoint.z = -buff*sin(tmp)+_gPoint.z*cos(tmp);
        buff = _hPoint.twoD.x;
        _hPoint.twoD.x = buff*cos(tmp)+_hPoint.z*sin(tmp);
        _hPoint.z = -buff*sin(tmp)+_hPoint.z*cos(tmp);
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
        buff = _ePoint.twoD.x;
        _ePoint.twoD.x = buff*cos(tmp)+_ePoint.twoD.y*sin(tmp);
        _ePoint.twoD.y = -buff*sin(tmp)+_ePoint.twoD.y*cos(tmp);
        buff = _fPoint.twoD.x;
        _fPoint.twoD.x = buff*cos(tmp)+_fPoint.twoD.y*sin(tmp);
        _fPoint.twoD.y = -buff*sin(tmp)+_fPoint.twoD.y*cos(tmp);
        buff = _gPoint.twoD.x;
        _gPoint.twoD.x = buff*cos(tmp)+_gPoint.twoD.y*sin(tmp);
        _gPoint.twoD.y = -buff*sin(tmp)+_gPoint.twoD.y*cos(tmp);
        buff = _hPoint.twoD.x;
        _hPoint.twoD.x = buff*cos(tmp)+_hPoint.twoD.y*sin(tmp);
        _hPoint.twoD.y = -buff*sin(tmp)+_hPoint.twoD.y*cos(tmp);
    }
    [self goToZero:false orBack:true];
}
-(NSMutableArray*)convertTo2d{
    NSMutableArray *twoDcoords = [[NSMutableArray alloc]init];
    MyPoint tmp;
    tmp.twoD.x = _aPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _aPoint.z);
    tmp.twoD.y = _aPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _aPoint.z);
    tmp.z = _aPoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    tmp.twoD.x = _bPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _bPoint.z);
    tmp.twoD.y = _bPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _bPoint.z);
    tmp.z = _bPoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    tmp.twoD.x = _cPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _cPoint.z);
    tmp.twoD.y = _cPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _cPoint.z);
    tmp.z = _cPoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    tmp.twoD.x = _dPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _dPoint.z);
    tmp.twoD.y = _dPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _dPoint.z);
    tmp.z = _dPoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    tmp.twoD.x = _ePoint.twoD.x*(Z_C - Z_PL) / (Z_C - _ePoint.z);
    tmp.twoD.y = _ePoint.twoD.y*(Z_C - Z_PL) / (Z_C - _ePoint.z);
    tmp.z = _ePoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    tmp.twoD.x = _fPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _fPoint.z);
    tmp.twoD.y = _fPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _fPoint.z);
    tmp.z = _fPoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    tmp.twoD.x = _gPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _gPoint.z);
    tmp.twoD.y = _gPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _gPoint.z);
    tmp.z = _gPoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    tmp.twoD.x = _hPoint.twoD.x*(Z_C - Z_PL) / (Z_C - _hPoint.z);
    tmp.twoD.y = _hPoint.twoD.y*(Z_C - Z_PL) / (Z_C - _hPoint.z);
    tmp.z = _hPoint.z;
    tmp.z -= Z_PL;
    [twoDcoords addObject:[NSValue valueWithBytes:&tmp objCType:@encode(MyPoint)]];
    return twoDcoords;
}
@end
