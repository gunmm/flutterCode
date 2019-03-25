//
//  FlutterPushViewController.m
//  FlutterShowDemo
//
//  Created by minzhe on 2019/3/22.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "FlutterPushViewController.h"

@interface FlutterPushViewController ()

@property (weak, nonatomic) IBOutlet UILabel *midLabel;

@end

@implementation FlutterPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _midLabel.text = _midLabelText;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

@end
