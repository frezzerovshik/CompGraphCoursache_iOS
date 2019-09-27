//
//  ASParallelepipedPresentor.h
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASParallelepiped;
@interface ASParallelepipedPresentor : UIView
@property (strong , nonatomic) UIView *scene;//По идее, во втором презенторе ссылка должна быть weak
@property (strong , nonatomic) ASParallelepiped *figure;

//Конструктор из мяса и костей
-(instancetype)initWithExample: (ASParallelepiped*) example andView:(UIView*)myView;
#pragma mark - building methods
-(void) buildParallelepipedOnView;
-(void) deleteParallelepiped;
-(void) deleteInvizibleLines;
#pragma mark - colorful methods
-(void) fillingFigure;
-(void) buildShadow;
@end
