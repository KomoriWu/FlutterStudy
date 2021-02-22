package com.example.flutter_app

import android.os.Bundle
import android.widget.Button
import com.example.flutter_app.callhandler.FlutterEventPlugin
import io.flutter.embedding.android.FlutterActivity

/**
 * Created by wuzhen
 * on 2/22/21 3:27 PM
 * 跳转到原生界面
 */
class OneActivity : FlutterActivity() {

    companion object {
        const val EVENT_TOAST = "event_toast"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_one)
        val btn: Button = findViewById(R.id.btn_flutter)
        btn.setOnClickListener {
            //向flutter发送事件
            FlutterEventPlugin.sendContent(EVENT_TOAST)
        }
    }
}

