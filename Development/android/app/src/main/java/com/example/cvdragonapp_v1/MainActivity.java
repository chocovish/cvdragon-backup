package com.example.cvdragonapp_v1;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;


//For disableing screenshot...
import android.view.WindowManager.LayoutParams;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    getWindow().addFlags(LayoutParams.FLAG_SECURE); //For disableing screenshot
    GeneratedPluginRegistrant.registerWith(this);
  }
}
