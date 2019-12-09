//
//  ViewController.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ViewController.h"
#import "ASPyramidPresentor.h"
@interface ViewController ()
@property (strong,nonatomic) ASPyramidPresentor *workingSessionPyraminHandler;
@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _workingSessionPyraminHandler = [[ASPyramidPresentor alloc] init];
    [_workingSessionPyraminHandler buildPyramidOnView];
}


@end
