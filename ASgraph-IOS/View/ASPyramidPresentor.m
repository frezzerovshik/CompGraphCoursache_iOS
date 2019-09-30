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
@property (strong , nonatomic) UIBezierPath* path;
@end
@implementation ASPyramidPresentor
-(instancetype)initWithExample:(ASPyramid *)example andView:(UIView *)myView{
    self = [super init];
    if(self){
        _figure = example;
        _scene = myView;
        _path = [[UIBezierPath alloc] init];
    }
    return self;
}
-(void)buildPyramidOnView{
    ASPyramid* tmp;
    tmp = [_figure convertTo2d];
    [_path moveToPoint:tmp.aPoint.twoD];
    [_path addLineToPoint:tmp.bPoint.twoD];
    [_path moveToPoint:tmp.bPoint.twoD];
    [_path addLineToPoint:tmp.cPoint.twoD];
    [_path moveToPoint:tmp.cPoint.twoD];
    [_path addLineToPoint:tmp.dPoint.twoD];
    [_path moveToPoint:tmp.dPoint.twoD];
    [_path addLineToPoint:tmp.bPoint.twoD];
    [_path moveToPoint:tmp.aPoint.twoD];
    [_path addLineToPoint:tmp.cPoint.twoD];
    [_path addLineToPoint:tmp.dPoint.twoD];
    [_path stroke];//ДИБИЛ!!!
}
-(void)deletePyramid{
    //Еще не придумал как сделать
}
-(void)deleteInvizibleLines{
    /*
     Алгоритм Z-буфера
     
     Первоначальная задача - задать двумерный массив, на котором будет реализован Z-буфер
     Т.к. на разных устройствах фактический размер View будет разный, нужно задавать его динамически
     Для этого снимаю размеры view и создаю "массив массивов", высота view - количество элементов во внешнем массиве, ширина view - длина массива-элемента
     */
    NSMutableArray* z_bufer = [[NSMutableArray alloc] init];
    CGRect tmp = [_scene frame];
    for (CGFloat i = 0;i<tmp.size.height;++i){
        NSMutableArray* tmp_string = [[NSMutableArray alloc] initWithCapacity:(NSUInteger)tmp.size.width];
        [z_bufer addObject:tmp_string];
    }
    
}
-(void)fillingFigure{
    
}
-(void)buildShadow{
    
}
@end
