package com.umeng.umeng_sms_sdk;

import android.content.Context;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/**
 * UmengSmsSdkPlugin
 */
public class UmengSmsSdkPlugin implements FlutterPlugin, MethodCallHandler {

    private static final String TAG = "UmengSmsSdkPlugin";

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private MethodChannel channel;
    private Context mContext = null;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        mContext = flutterPluginBinding.getApplicationContext();
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "umeng_sms_sdk");
        channel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        try {
            if (!UmengFlutterPluginForSms.verifyMethodCall(mContext, call, result)) {
                result.notImplemented();
            }
        } catch (Exception e) {
            Log.e(TAG, "Exception:" + e.getMessage());
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }
}