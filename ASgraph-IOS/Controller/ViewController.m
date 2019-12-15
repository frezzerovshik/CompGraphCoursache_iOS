//
//  ViewController.m
//  ASgraph-IOS
//
//  Created by Артем Шарапов on 27/09/2019.
//  Copyright © 2019 Артем Шарапов. All rights reserved.
//

#import "ViewController.h"

#import "ASPyramidView.h"

#import "ASParallelepipedView.h"

#import "Pyramid.h"

#import "Parallelepiped.h"

#import "Defines_model.h"

enum directionOfMovement {left = 0,right,down,up,nearer,further};
enum directionOfRotation {eLeftX = 0,eLeftY = 1,eLeftZ = 2, eRightX = 3,eRightY = 4,eRightZ = 5};
@interface ViewController ()
@property (strong , nonatomic) IBOutlet ASParallelepipedView* myParallelepipedView;
@property (strong , nonatomic) IBOutlet ASPyramidView* myPyramidView;

@property (strong , nonatomic) IBOutlet UIButton *leftMovementOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *rightMovementOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *upMovementOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *downMovementOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *nearMovementOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *furtherMovementOfPyramid;

@property (strong , nonatomic) IBOutlet UIButton *leftXbuttonOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *rightXbuttonOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *leftYbuttonOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *rightYbuttonOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *leftZbuttonOfPyramid;
@property (strong , nonatomic) IBOutlet UIButton *rightZbuttonOfPyramid;

- (IBAction)movePyramid:(UIButton *)sender;
- (IBAction)rotatePyramid:(UIButton *)sender;
- (IBAction)changeSizePyramid:(UIButton *)sender;

- (IBAction)moveParallelepiped:(UIButton *)sender;
- (IBAction)rotateParallelepiped:(UIButton *)sender;
- (IBAction)changeSizeParallelepiped:(UIButton *)sender;
@end

@implementation ViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    //initialization of movement buttons
    [_leftMovementOfPyramid setTag:LEFT];
    [_rightMovementOfPyramid setTag:RIGHT];
    [_downMovementOfPyramid setTag:DOWN];
    [_upMovementOfPyramid setTag:UP];
    [_nearMovementOfPyramid setTag:Z_PLUS];
    [_furtherMovementOfPyramid setTag:Z_MINUS];
    
    //initialization of rotation button
    [_leftXbuttonOfPyramid setTag:0];
    [_leftYbuttonOfPyramid setTag:1];
    [_leftZbuttonOfPyramid setTag:2];
    [_rightXbuttonOfPyramid setTag:3];
    [_rightYbuttonOfPyramid setTag:4];
    [_rightZbuttonOfPyramid setTag:5];
    
}
- (IBAction)movePyramid:(UIButton *)sender{
    enum directionOfMovement value;
    switch ([sender tag]){
        case left:
            value = left;
            break;
        case right:
            value = right;
            break;
        case down:
            value = down;
            break;
        case up:
            value = up;
            break;
        case nearer:
            value = nearer;
            break;
        case further:
            value = further;
            break;
        default:
            NSLog(@"Error with button tag\n");
            break;
    }
     [_myPyramidView.pyramid movementWithVector:value];
     [_myPyramidView setNeedsDisplay];
}
- (IBAction)rotatePyramid:(UIButton *)sender{
    enum directionOfRotation value;
    switch ([sender tag]) {
        case eLeftY:{
            value = leftY;
            break;
        }
        case eLeftX:{
            value = leftX;
            break;
        }
        case eLeftZ:{
            value = leftZ;
            break;
        }
        case eRightY:{
            value = rightY;
            break;
        }
        case eRightX:{
            value = rightX;
            break;
        }
        case eRightZ:{
            value = rightZ;
            break;
        }
        default:
            NSLog(@"НЕ УДАЛОСЬ РАСПОЗНАТЬ ТЭГ ПРИ ПОВОРОТЕ\n");
            break;
    }
    [_myPyramidView.pyramid rotateWithVector:value];
    [_myPyramidView setNeedsDisplay];
}
- (IBAction)changeSizePyramid:(UIButton *)sender{}

- (IBAction)moveParallelepiped:(UIButton *)sender{}
- (IBAction)rotateParallelepiped:(UIButton *)sender{}
- (IBAction)changeSizeParallelepiped:(UIButton *)sender{}
@end
