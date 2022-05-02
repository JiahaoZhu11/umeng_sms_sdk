# UMSMS Flutter Plugin

A Flutter plugin for integrating UMSMS, which is a SMS SDK provided by UMeng.

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  umeng_sms_sdk: 1.0.0
```

## Usage

```dart
import 'package:umeng_sms_sdk/umeng_sms_sdk.dart';
```

**Attention:**

It requires [umeng_common_sdk](https://pub.dev/packages/umeng_common_sdk) and needs to call UmengCommonSdk.initCommon first to make sure other functions can work properly.
