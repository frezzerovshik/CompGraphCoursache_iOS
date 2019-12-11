//
//  ASPyramidPresentor.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ASPyramidPresentor.h"
#import "Pyramid.h"




@implementation ASPyramidPresentor

-(void)drawRect:(CGRect)rect{
    if(_wasBuilt != YES){
        _wasBuilt = YES;
        MyPoint a;
        MyPoint b;
        MyPoint c;
        MyPoint d;
        a.twoD.x = 200;
        a.twoD.y = 180;
        a.z = 170;
        b.twoD.x = 130;
        b.twoD.y = 140;
        b.z = 150;
        c.twoD.x = 130;
        c.twoD.y = 120;
        c.z = 110;
        d.twoD.x = 150;
        d.twoD.y = 170;
        d.z = 180;
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
    CGContextSetStrokeColorWithColor(cont, [UIColor greenColor].CGColor);
    CGContextStrokePath(cont);
    
}



@end
