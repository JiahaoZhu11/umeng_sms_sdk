//
//  UmengFlutterPluginForSms.m
//  umeng_sms_sdk
//
//  Created by 朱嘉皓 on 2022/4/29.
//
#import "UmengFlutterPluginForSms.h"
#import <Flutter/Flutter.h>
#import <UMSMS/UMSMS.h>

@implementation UmengFlutterPluginForSms

+ (BOOL) handleMethodCall: (FlutterMethodCall*) call result: (FlutterResult) result {
    BOOL resultCode = YES;
    NSArray* arguments = (NSArray *) call.arguments;
    
    if ([@"getVersion" isEqualToString: call.method]) {
        [UmengFlutterPluginForSms _getVersionWithResult: result];
    } else if ([@"setSMSSDKInfo" isEqualToString: call.method]) {
        [UmengFlutterPluginForSms _setSMSSDKInfoWithArguments: arguments result: result];
    } else if ([@"getVerificationCode" isEqualToString: call.method]) {
        [UmengFlutterPluginForSms _getVerificationCodeWithArguments: arguments result: result];
    } else if ([@"commitVerificationCode" isEqualToString: call.method]) {
        [UmengFlutterPluginForSms _commitVerificationCodeWithArguments: arguments result: result];
    } else {
        resultCode = NO;
    }
    
    return resultCode;
}

+ (void) _getVersionWithResult: (FlutterResult) result {
    result([UMSMS getVersion]);
}

+ (void) _setSMSSDKInfoWithArguments: (NSArray*) arguments result: (FlutterResult) result {
    NSString* info = arguments[1];
    [UMSMS setSMSSDKInfo: info complete: ^(NSDictionary * _Nonnull resultDic) {
        result(resultDic);
    }];
}

+ (void) _getVerificationCodeWithArguments: (NSArray*) arguments result: (FlutterResult) result {
    NSString* phoneNumber = arguments[0];
    NSString* templateID = arguments[1];
    [UMSMS getVerificationCodeWithPhoneNumber: phoneNumber templateID: templateID complete: ^(NSDictionary * _Nonnull resultDic) {
        result(resultDic);
    }];
}

+ (void) _commitVerificationCodeWithArguments: (NSArray*) arguments result: (FlutterResult) result {
    NSString* phoneNumber = arguments[0];
    NSString* vCode = arguments[1];
    [UMSMS commitWithPhoneNumber:phoneNumber vCode:vCode complete: ^(NSDictionary * _Nonnull resultDic) {
        result(resultDic);
    }];
}

@end
