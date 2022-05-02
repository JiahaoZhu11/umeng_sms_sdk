//
//  UmengSmsSdkPlugin.m
//  umeng_sms_sdk
//
//  Created by 朱嘉皓 on 2022/4/29.
//
#import "UmengSmsSdkPlugin.h"
#import "UmengFlutterPluginForSms.h"

@implementation UmengSmsSdkPlugin

+ (void) registerWithRegistrar: (NSObject<FlutterPluginRegistrar>*) registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel methodChannelWithName: @"umeng_sms_sdk" binaryMessenger: [registrar messenger]];
    UmengSmsSdkPlugin* instance = [[UmengSmsSdkPlugin alloc] init];
    [registrar addMethodCallDelegate: instance channel: channel];
}

- (void) handleMethodCall: (FlutterMethodCall*) call result: (FlutterResult) result {
    if (![UmengFlutterPluginForSms handleMethodCall: call result: result]) {
        result(FlutterMethodNotImplemented);
    }
}

@end


