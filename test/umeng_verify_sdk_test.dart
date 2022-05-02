import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:umeng_sms_sdk/umeng_sms_sdk.dart';

void main() {
  const MethodChannel channel = MethodChannel('umeng_sms_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getVersion', () async {
    expect(await UmengSmsSdk.version, '42');
  });
}
