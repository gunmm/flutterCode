//
//  MyFlutterViewController.m
//  FlutterShowDemo
//
//  Created by minzhe on 2019/3/22.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "MyFlutterViewController.h"
#import "FlutterPushViewController.h"
#import "AppDelegate.h"

@interface MyFlutterViewController ()

@end

@implementation MyFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setInitialRoute:@"flutterPage"];
    
    NSString *channelName = @"flutterPageChannel";
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:self];
    __weak typeof(self) weakSelf = self;
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"pushiOSVC"]) {
            FlutterPushViewController *pushVc = [FlutterPushViewController new];
            pushVc.midLabelText = call.arguments;
            [weakSelf.navigationController pushViewController:pushVc animated:YES];
        } else if ([call.method isEqualToString:@"showiOSAlert"]) {
            NSString *title = [call.arguments objectForKey:@"title"];
            NSString *content = [call.arguments objectForKey:@"content"];

            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:content
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                  }];
            
            [alert addAction:defaultAction];
            [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
        }  else if ([call.method isEqualToString:@"getiOSValue"]) {
            if (result) {
                NSDictionary *dataDic = @{@"title":@"传过来的title", @"content":@"传过来的content"};
                result(dataDic);
            }
        }
    }];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


@end
