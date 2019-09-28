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
}
-(void)deletePyramid{
    
}
-(void)deleteInvizibleLines{
    
}
-(void)fillingFigure{
    
}
-(void)buildShadow{
    
}
@end
