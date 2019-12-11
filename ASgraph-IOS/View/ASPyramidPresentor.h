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
@property (strong , nonatomic ) ASPyramid* pyramid;
@property (nonatomic , assign) BOOL wasBuilt;

-(void) deleteInvizibleLines;
/*-(void) buildShadow;
-(void) fillPyramid;*/
@end
