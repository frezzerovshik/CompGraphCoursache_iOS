//
//  ASPyramidPresentor.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ASPyramidView.h"
#import "Pyramid.h"
#import "zBuff.h"



@implementation ASPyramidView

-(void)drawRect:(CGRect)rect{
    if(_wasBuilt != YES){
        _wasBuilt = YES;
        MyPoint a;
        MyPoint b;
        MyPoint c;
        MyPoint d;
        a.twoD.x = 85.657157;
        a.twoD.y = 124.356155;
        a.z = 156.29555;
        
        b.twoD.x = 72.945044;
        b.twoD.y = 73.082330;
        b.z = 90.601417;
        
        c.twoD.x = 116.623375;
        c.twoD.y = 51.445121;
        c.z = 167.900502;
        
        d.twoD.x = 39.742789;
        d.twoD.y = 59.880149;
        d.z = 193.402528;
        _pyramid = [[ASPyramid alloc] initWithPoints:a and:b and:c and:d];
    }
    ASPyramid *tmp = [[ASPyramid alloc] initWithPoints:_pyramid.aPoint and:_pyramid.bPoint and:_pyramid.cPoint and:_pyramid.dPoint];
    tmp =  [tmp convertTo2d];
    NSLog(@"Координаты точки А: (%f , %f , %f) " , tmp.aPoint.twoD.x ,  tmp.aPoint.twoD.y ,  tmp.aPoint.z );
    NSLog(@"Координаты точки B: (%f , %f , %f) " , tmp.bPoint.twoD.x ,  tmp.bPoint.twoD.y ,  tmp.bPoint.z );
    NSLog(@"Координаты точки C: (%f , %f , %f) " , tmp.cPoint.twoD.x ,  tmp.cPoint.twoD.y ,  tmp.cPoint.z );
    NSLog(@"Координаты точки D: (%f , %f , %f) " , tmp.dPoint.twoD.x ,  tmp.dPoint.twoD.y ,  tmp.dPoint.z );
    CGContextRef cont = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(cont, tmp.aPoint.twoD.x, tmp.aPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.bPoint.twoD.x, tmp.bPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.cPoint.twoD.x, tmp.cPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.dPoint.twoD.x, tmp.dPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.aPoint.twoD.x, tmp.aPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.cPoint.twoD.x, tmp.cPoint.twoD.y);
    CGContextMoveToPoint(cont, tmp.bPoint.twoD.x, tmp.bPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.dPoint.twoD.x, tmp.dPoint.twoD.y);
    CGContextSetStrokeColorWithColor(cont, [UIColor redColor].CGColor);
    CGContextStrokePath(cont);
    
}
-(void)deleteInvizibleLinesWithRect:(CGRect)rect{
    /*Задача на ночь*/
    CGFloat zValuesOfTops[4] = {_pyramid.aPoint.z , _pyramid.bPoint.z , _pyramid.cPoint.z, _pyramid.dPoint.z};//Создаем массив, хранящий в себе координаты по оси Z для каждой вершины для нахождения самой минимальной
    CGFloat zMin = 1000;
    for(int i = 0;i<4;++i){
        if(zValuesOfTops[i] < zMin )
            zMin = zValuesOfTops[i];
    }
    zBuff zBuffer[(int)(rect.size.height * rect.size.width)];
    int i = 0;
    for(CGFloat x = 0;x<rect.size.width;++x){
        for(CGFloat y = 0; y<rect.size.height;++y){
            zBuffer[i].coords.twoD.x = x;
            zBuffer[i].coords.twoD.y = y;
            zBuffer[i].coords.z = zMin;
            zBuffer[i].color = [[UIColor alloc] initWithCGColor:[UIColor whiteColor].CGColor];
            i++;
        }
    }
}


@end
