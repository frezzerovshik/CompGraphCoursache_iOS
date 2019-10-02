//
//  ASPyramidPresentor.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ASPyramidPresentor.h"
#import "Pyramid.h"
#import "zBuff.h"
#import "Defines_view.h"
@interface ASPyramidPresentor()
//Ребра пирамиды
@property (strong , nonatomic) UIBezierPath* pathAB;
@property (strong , nonatomic) UIBezierPath* pathAC;
@property (strong , nonatomic) UIBezierPath* pathAD;
@property (strong , nonatomic) UIBezierPath* pathCD;
@property (strong , nonatomic) UIBezierPath* pathCB;
@property (strong , nonatomic) UIBezierPath* pathBD;
@property (strong , nonatomic) NSMutableArray* z_bufer;
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
        _z_bufer = [[NSMutableArray alloc] init];
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
    //1 - Создаю двумерный массив
    CGRect tmp = [_scene frame];
    for (CGFloat i = 0;i<tmp.size.height;++i){
        NSMutableArray* tmp_string = [[NSMutableArray alloc] initWithCapacity:(NSUInteger)tmp.size.width];
        [_z_bufer addObject:tmp_string];
    }
    /*
     В следующем куске кода я делаю следующее
     - прохожусь по всем элементам массива и инициализирую их как белые точки на обычном удалении (абстрактной плоскости XY, для которой точки могут нахожиться ближе и дальше нее)
     */
    for(NSUInteger i = 0;i<_z_bufer.count;++i){
        NSMutableArray* tmp = [_z_bufer objectAtIndex:i];
        for(NSUInteger j = 0;j<tmp.count;++j){
            zBuff temp;
            temp.isBlack = NO;
            temp.coords.z = DEFAULT_DEPTH;
            temp.coords.twoD.x = j;
            temp.coords.twoD.y = i;
            [tmp addObject:[NSValue valueWithBytes:&temp objCType:@encode(zBuff)]];
        }
    }
    /*Далее необходимо взять каждый путь и поочередно занести его точки в z-буффер
     Если точка видима - ее значению isBlack = YES, иначе - пропуск итерации
     
     В ДАННОЙ ВЕРСИИ Я ЗАТРУДНЯЮСЬ ПРАВИЛЬНО ПРОАНАЛИЗИРОВАТЬ ИЗМЕНЕНИЕ КООРДИНАТЫ Z , ПОЭТОМУ ЕСЛИ БУДУТ БАГИ С УДАЛЕНИЕМ ЛИНИЙ - ОНИ ТУТ!!!!
     */
    for (NSUInteger i = 0; i<_z_bufer.count; ++i) {
        NSMutableArray* tmp = [_z_bufer objectAtIndex:i];
        for (NSUInteger j = 0; j < tmp.count ; ++j) {
            zBuff temp;
            [[tmp objectAtIndex:j]getValue:&temp];
            if([_pathAB containsPoint:temp.coords.twoD]){
                CGFloat comparedZ = 0;
                _figure.aPoint.z>_figure.bPoint.z ? comparedZ = _figure.aPoint.z : _figure.bPoint.z;
                if(temp.coords.z>comparedZ){
                    temp.isBlack = YES;
                    temp.coords.z = comparedZ;
                }
                else{
                     temp.isBlack = NO;
                }
            }
            if([_pathAC containsPoint:temp.coords.twoD]){
                CGFloat comparedZ = 0;
                _figure.aPoint.z>_figure.cPoint.z ? comparedZ = _figure.aPoint.z : _figure.cPoint.z;
                if(temp.coords.z>comparedZ){
                    temp.isBlack = YES;
                    temp.coords.z = comparedZ;
                }
                else{
                    temp.isBlack = NO;
                }
            }
            if([_pathAD containsPoint:temp.coords.twoD]){
                CGFloat comparedZ = 0;
                _figure.aPoint.z>_figure.dPoint.z ? comparedZ = _figure.aPoint.z : _figure.dPoint.z;
                if(temp.coords.z>comparedZ){
                    temp.isBlack = YES;
                    temp.coords.z = comparedZ;
                }
                else{
                    temp.isBlack = NO;
                }
            }
            if([_pathCD containsPoint:temp.coords.twoD]){
                CGFloat comparedZ = 0;
                _figure.cPoint.z>_figure.dPoint.z ? comparedZ = _figure.cPoint.z : _figure.dPoint.z;
                if(temp.coords.z>comparedZ){
                    temp.isBlack = YES;
                    temp.coords.z = comparedZ;
                }
                else{
                    temp.isBlack = NO;
                }
            }
            if([_pathCB containsPoint:temp.coords.twoD]){
                CGFloat comparedZ = 0;
                _figure.cPoint.z>_figure.bPoint.z ? comparedZ = _figure.cPoint.z : _figure.bPoint.z;
                if(temp.coords.z>comparedZ){
                    temp.isBlack = YES;
                    temp.coords.z = comparedZ;
                }
                else{
                    temp.isBlack = NO;
                }
            }
            if([_pathBD containsPoint:temp.coords.twoD]){
                CGFloat comparedZ = 0;
                _figure.bPoint.z>_figure.dPoint.z ? comparedZ = _figure.bPoint.z : _figure.dPoint.z;
                if(temp.coords.z>comparedZ){
                    temp.isBlack = YES;
                    temp.coords.z = comparedZ;
                }
                else{
                    temp.isBlack = NO;
                }
            }
            
        }
    }
    /*НУ ВОТ ПО ИДЕЕ И ВСЕ, АЛГОРИТМ Z БУФЕРА РЕАЛИЗОВАН, ПЕРЕСМОТРИ НА СВЕЖУЮ ГОЛОВУ*/
}
-(void)fillingFigure{
    
}
-(void)buildShadow{
    
}
@end
