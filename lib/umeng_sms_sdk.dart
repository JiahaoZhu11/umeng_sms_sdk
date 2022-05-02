import 'dart:async';

import 'package:flutter/services.dart';

class UmengSmsSdk {
  static const MethodChannel _channel = const MethodChannel('umeng_sms_sdk');

  /**
   *  获取SDK版本号
   */

  static Future<String?> get version async {
    final String? version = await _channel.invokeMethod('getVersion');
    return version;
  }

  /**
   *  初始化SDK调用参数，app生命周期内调用一次
   *  @param  info app对应的秘钥
   *  @param  complete 结果异步回调到主线程，成功时resultDic=@{resultCode:600000, msg:...}，其他情况时"resultCode"值请参考PNSReturnCode
   */

  static Future<dynamic> setSMSSDKInfo(String androidInfo, String iosInfo) async {
    List<dynamic> params = [androidInfo, iosInfo];
    final dynamic result = await _channel.invokeMethod('setSMSSDKInfo', params);
    return result;
  }

  /**
   *  发送验证码
   *  @param  phoneNumber 目标手机号码
   */

  static Future<dynamic> getVerificationCode(String phoneNumber, String templateID) async {
    List<dynamic> params = [phoneNumber, templateID];
    final dynamic result = await _channel.invokeMethod('getVerificationCode', params);
    return result;
  }

  /**
   *  提交验证码
   *  @param  phoneNumber 目标手机号码
   *  @param  vCode 验证码
   */

  static Future<dynamic> commitVerificationCode(String phoneNumber, String vCode) async {
    List<dynamic> params = [phoneNumber, vCode];
    final dynamic result = await _channel.invokeMethod('commitVerificationCode', params);
    return result;
  }
}
