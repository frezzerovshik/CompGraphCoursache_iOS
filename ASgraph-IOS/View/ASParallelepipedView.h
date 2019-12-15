//
//  ASParallelepipedPresentor.h
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASParallelepiped;
@interface ASParallelepipedView : UIView
@property (strong,nonatomic) ASParallelepiped *parall;
@property (nonatomic , assign) BOOL wasBuilt;
@end
