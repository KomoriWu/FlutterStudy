package com.example.flutter_app.callhandler

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel

/**
 * Created by wuzhen
 * on 2/22/21 4:57 PM
 * 发送消息到flutter
 */

class FlutterEventPlugin : FlutterPlugin, EventChannel.StreamHandler {

    private var channelName = "com.wz.event/plugin";

    companion object {
        private var eventChannel: EventChannel? = null

        private var eventSink: EventChannel.EventSink? = null

        private var context: Context? = null

        fun sendContent(content: String) {
            eventSink?.success(content);
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel = EventChannel(binding.binaryMessenger, channelName)
        eventChannel!!.setStreamHandler(this)
        context = binding.applicationContext
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        eventChannel = null
        eventChannel!!.setStreamHandler(null)
    }
}
