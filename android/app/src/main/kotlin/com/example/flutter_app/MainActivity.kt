package com.example.flutter_app

import android.content.Intent
import com.example.flutter_app.callhandler.FlutterEventPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity : FlutterActivity() {
    companion object {
        const val CHANNEL = "com.wz.jump/plugin"
        const val ONE_ACT = "one_act"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine.plugins.add(FlutterEventPlugin())
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
                .setMethodCallHandler { call: MethodCall?, result: MethodChannel.Result? ->
                    //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务，本案例做了2个跳转的业务
                    if (call?.method == ONE_ACT) {
                        //跳转到指定Activity
                        val intent = Intent(context, OneActivity::class.java)
                        context.startActivity(intent)
                        //返回给flutter的参数
                        result?.success("success")
                    }
                }
    }

}
