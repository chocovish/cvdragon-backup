import 'package:cvdragonapp_v1/demologin.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:flutter/material.dart';

String name, email;

void main() {
  // Onesignal initialization..
  OneSignal.shared.init("c4abfa3d-d6b0-4f30-bc6f-8dc0a8c6387a", iOSSettings: {
    OSiOSSettings.autoPrompt: false,
    OSiOSSettings.inAppLaunchUrl: true
  });
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

  //Turning of landscape mode..
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
  //debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var hometext = "Home";

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]); //add for hiding navand status bar

    return MaterialApp(home: DemoLogin());
  }
}
