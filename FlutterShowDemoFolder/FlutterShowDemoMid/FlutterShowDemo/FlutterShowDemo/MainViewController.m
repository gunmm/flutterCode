//
//  MainViewController.m
//  FlutterShowDemo
//
//  Created by minzhe on 2019/3/22.
//  Copyright © 2019 minzhe. All rights reserved.
//

#import "MainViewController.h"
#import <Flutter/Flutter.h>
#import "FlutterPushViewController.h"

@interface MainViewController () <FlutterStreamHandler>

@property (nonatomic, strong) FlutterMethodChannel *messageChannel;
@property (nonatomic, strong) FlutterViewController *flutterViewController;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [self.flutterViewController setInitialRoute:@"applePresent"];
    
    // 要与main.dart中一致
    NSString *channelName = @"methodChannel";
    self.messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:self.flutterViewController];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
//}

- (IBAction)presentAct:(id)sender {
    [self presentViewController:self.flutterViewController animated:YES completion:nil];
    __weak typeof(self) weakSelf = self;
    [self.messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"disMissFlutterVc"]) {
            NSLog(@"-------------参数传过来的参数：%@", call.arguments);
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }
    }];

    //方法二
    NSString *channelName2 = @"eventChannel";
    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName2 binaryMessenger:self.flutterViewController];
    // 代理FlutterStreamHandler
    [evenChannal setStreamHandler:self];
}

- (IBAction)pushAct:(id)sender {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    [flutterViewController setInitialRoute:@"applePush"];
    // 要与main.dart中一致
    NSString *channelName = @"methodChannel";
    __weak typeof(self) weakSelf = self;
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"iOSAndFlutter"]) {
            if (result) {
                result(@"返回给flutter的内容");
            }
            FlutterPushViewController *pushVc = [FlutterPushViewController new];
            pushVc.midLabelText = call.arguments;
            [weakSelf.navigationController pushViewController:pushVc animated:YES];
        }
    }];
    flutterViewController.title = @"测试";
    flutterViewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

- (IBAction)invokeFlutter:(id)sender {
    //这个事件的实现前提是self.messageChannel有值   也就是
    [self.messageChannel invokeMethod:@"iOSInvokeFlutter" arguments:@"iOS主动调flutter" result:^(id  _Nullable result) {
        NSLog(@"%@", result);
    }];
}


#pragma mark - <FlutterStreamHandler>
// // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    if (events) {
        events(@"初始化present时候传值过去的title");
    }
    return nil;
}

/// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    NSLog(@"%@", arguments);
    return nil;
}


@end
