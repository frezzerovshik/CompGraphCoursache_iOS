//
//  ASParallelepipedPresentor.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASParallelepipedPresentor.h"
#import "Parallelepiped.h"
#import "Point.h"
@implementation ASParallelepipedPresentor

-(void) drawRect:(CGRect) rect{
    if(_wasBuilt != YES){
    MyPoint initPoints[8];
    initPoints[0].twoD.x = 50;
    initPoints[0].twoD.y = 100;
    initPoints[0].z = 100;
    
    initPoints[1].twoD.x = 50;
    initPoints[1].twoD.y = 400;
    initPoints[1].z = 100;
    
    initPoints[2].twoD.x = 250;
    initPoints[2].twoD.y = 400;
    initPoints[2].z = 100;
    
    initPoints[3].twoD.x = 250;
    initPoints[3].twoD.y = 100;
    initPoints[3].z = 100;
    
    initPoints[4].twoD.x = 250;
    initPoints[4].twoD.y = 400;
    initPoints[4].z = 400;
    
    initPoints[5].twoD.x = 250;
    initPoints[5].twoD.y = 100;
    initPoints[5].z = 400;
    
    initPoints[6].twoD.x = 50;
    initPoints[6].twoD.y = 100;
    initPoints[6].z = 400;
    
    initPoints[7].twoD.x = 50;
    initPoints[7].twoD.y = 400;
    initPoints[7].z = 400;
        _parall = [[ASParallelepiped alloc] initWithPoints:initPoints[0] and:initPoints[1] and:initPoints[2] and:initPoints[3] and:initPoints[4] and:initPoints[5] and:initPoints[6] and:initPoints[7]];
        _wasBuilt = YES;
    }
    ASParallelepiped *tmp = [[ASParallelepiped alloc] init];
    tmp = [_parall convertTo2d];
    NSLog(@"Координаты точки А: (%f , %f , %f) " , tmp.aPoint.twoD.x ,  tmp.aPoint.twoD.y ,  tmp.aPoint.z );
    NSLog(@"Координаты точки B: (%f , %f , %f) " , tmp.bPoint.twoD.x ,  tmp.bPoint.twoD.y ,  tmp.bPoint.z );
    NSLog(@"Координаты точки C: (%f , %f , %f) " , tmp.cPoint.twoD.x ,  tmp.cPoint.twoD.y ,  tmp.cPoint.z );
    NSLog(@"Координаты точки D: (%f , %f , %f) " , tmp.dPoint.twoD.x ,  tmp.dPoint.twoD.y ,  tmp.dPoint.z );
    NSLog(@"Координаты точки E: (%f , %f , %f) " , tmp.ePoint.twoD.x ,  tmp.ePoint.twoD.y ,  tmp.ePoint.z );
    NSLog(@"Координаты точки F: (%f , %f , %f) " , tmp.fPoint.twoD.x ,  tmp.fPoint.twoD.y ,  tmp.fPoint.z );
    NSLog(@"Координаты точки G: (%f , %f , %f) " , tmp.gPoint.twoD.x ,  tmp.gPoint.twoD.y ,  tmp.gPoint.z );
    NSLog(@"Координаты точки H: (%f , %f , %f) " , tmp.hPoint.twoD.x ,  tmp.hPoint.twoD.y ,  tmp.hPoint.z );
    CGContextRef cont = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(cont, tmp.aPoint.twoD.x, tmp.aPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.bPoint.twoD.x, tmp.bPoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.cPoint.twoD.x, tmp.cPoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.dPoint.twoD.x, tmp.dPoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.aPoint.twoD.x, tmp.aPoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.gPoint.twoD.x, tmp.gPoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.fPoint.twoD.x, tmp.fPoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.ePoint.twoD.x, tmp.ePoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.hPoint.twoD.x, tmp.hPoint.twoD.y);
    
    CGContextAddLineToPoint(cont, tmp.gPoint.twoD.x, tmp.gPoint.twoD.y);
    
    CGContextMoveToPoint(cont, tmp.hPoint.twoD.x, tmp.hPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.bPoint.twoD.x, tmp.bPoint.twoD.y);
    
    CGContextMoveToPoint(cont, tmp.cPoint.twoD.x, tmp.cPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.ePoint.twoD.x, tmp.ePoint.twoD.y);
    
    CGContextMoveToPoint(cont, tmp.dPoint.twoD.x, tmp.dPoint.twoD.y);
    CGContextAddLineToPoint(cont, tmp.fPoint.twoD.x, tmp.fPoint.twoD.y);
    
    CGContextSetStrokeColorWithColor(cont, [UIColor redColor].CGColor);
    CGContextStrokePath(cont);
}

@end
