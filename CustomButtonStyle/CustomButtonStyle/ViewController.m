//
//  ViewController.m
//  CustomButtonStyle
//
//  Created by moyekong on 12/29/15.
//  Copyright © 2015 wiwide. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ImageTitleSpacing.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *bottomButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self updateUI];
}

- (void)updateUI {
    CGFloat space = 20.0;
    [self.topButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop
                                    imageTitleSpace:space];
    
    [self.leftButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft
                                     imageTitleSpace:space];
    
    [self.bottomButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleBottom
                                       imageTitleSpace:space];
    
    [self.rightButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight
                                      imageTitleSpace:space];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
