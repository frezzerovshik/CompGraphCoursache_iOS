//
//  ASPyramidPresentor.h
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASPyramid;
@interface ASPyramidPresentor : UIView
@property (strong , nonatomic) UIView *scene;//По идее, во втором презенторе ссылка должна быть weak
@property (strong , nonatomic) ASPyramid *figure;
//Конструктор из мяса и костей
-(instancetype)initWithExample: (ASPyramid*) example andView:(UIView*)myView;
#pragma mark - building methods
-(void) buildPyramidOnView;
-(void) deletePyramid;
-(void) deleteInvizibleLines;
#pragma mark - colorful methods
-(void) fillingFigure;
-(void) buildShadow;
@end
