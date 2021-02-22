package com.example.flutter_app.callhandler

import android.content.Context
import android.content.Intent
import com.example.flutter_app.MainActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry

/**
 * Created by wuzhen
 * on 2/22/21 11:15 AM
 * flutter 与原生交互的桥接
 */
@Deprecated("API废弃")
class FlutterJumpPlugin(var context: Context) : MethodCallHandler {

    companion object {
        const val CHANNEL = "com.wz.jump/plugin"
        const val MAIN_ACT = "main_act"     //跳转到MainActivity
        var channel: MethodChannel? = null;

        fun registerWith(registrar: PluginRegistry.Registrar) {
            channel = MethodChannel(registrar.messenger(), CHANNEL)
            val instance = FlutterJumpPlugin(registrar.activity())
            //setMethodCallHandler在此通道上接收方法调用的回调
            channel?.setMethodCallHandler(instance);
        }
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        //通过MethodCall可以获取参数和方法名，然后再寻找对应的平台业务，本案例做了2个跳转的业务
        if (call.method == MAIN_ACT) {
            //跳转到指定Activity
            val intent = Intent(context, MainActivity::class.java)
            context.startActivity(intent)
            //返回给flutter的参数
            result.success("success");
        }
    }
}