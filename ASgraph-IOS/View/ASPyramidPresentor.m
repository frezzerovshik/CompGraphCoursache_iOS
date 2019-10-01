//
//  ASPyramidPresentor.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ASPyramidPresentor.h"
#import "Pyramid.h"
@interface ASPyramidPresentor()
//Ребра пирамиды
@property (strong , nonatomic) UIBezierPath* pathAB;
@property (strong , nonatomic) UIBezierPath* pathAC;
@property (strong , nonatomic) UIBezierPath* pathAD;
@property (strong , nonatomic) UIBezierPath* pathCD;
@property (strong , nonatomic) UIBezierPath* pathCB;
@property (strong , nonatomic) UIBezierPath* pathBD;
@end
@implementation ASPyramidPresentor
-(instancetype)initWithExample:(ASPyramid *)example andView:(UIView *)myView{
    self = [super init];
    if(self){
        _figure = example;
        _scene = myView;
        _pathAB = [[UIBezierPath alloc] init];
        _pathAC = [[UIBezierPath alloc] init];
        _pathAD = [[UIBezierPath alloc] init];
        _pathCD = [[UIBezierPath alloc] init];
        _pathCB = [[UIBezierPath alloc] init];
        _pathBD = [[UIBezierPath alloc] init];
    }
    return self;
}
-(void)buildPyramidOnView{
    ASPyramid* tmp;
    tmp = [_figure convertTo2d];
    [_pathAB moveToPoint:tmp.aPoint.twoD];
    [_pathAB addLineToPoint:tmp.bPoint.twoD];
    [_pathAB closePath];
    
    [_pathAC moveToPoint:tmp.aPoint.twoD];
    [_pathAC addLineToPoint:tmp.cPoint.twoD];
    [_pathAC closePath];
    
    [_pathAD moveToPoint:tmp.aPoint.twoD];
    [_pathAD addLineToPoint:tmp.dPoint.twoD];
    [_pathAD closePath];
    
    [_pathCD moveToPoint:tmp.cPoint.twoD];
    [_pathCD addLineToPoint:tmp.dPoint.twoD];
    [_pathCD closePath];
    
    [_pathCB moveToPoint:tmp.cPoint.twoD];
    [_pathCB addLineToPoint:tmp.bPoint.twoD];
    [_pathCB closePath];
    
    [_pathBD moveToPoint:tmp.bPoint.twoD];
    [_pathBD addLineToPoint:tmp.dPoint.twoD];
    [_pathBD closePath];
    //Хм...Для начала пропишем все ребра, чтобы в дальнейшем проверять, принадлежит ли точка ребру и заносить или не заносить ее в Z-буффер.
    //В итоге при каждом изменении будут вызываться методы удаления текущей пирамиды и отрисовки только черных пикселей, чтобы не потерять вторую фигуру, далее будет осуществляться заливка и построение тени
    //Вот так вот
    //Не забудь все это, ведь ты ляжешь спать после ночной смены и опять нихера не вспомнишь как и что ты придумал
}
-(void)deletePyramid{
    //Еще не придумал как сделать
}
-(void)deleteInvizibleLines{
    /*
     Алгоритм Z-буфера
     
     Первоначальная задача - задать двумерный массив, на котором будет реализован Z-буфер
     
     */

    
}
-(void)fillingFigure{
    
}
-(void)buildShadow{
    
}
@end
