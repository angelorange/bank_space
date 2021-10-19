import 'package:bankinspace/app/modules/home/widgets/home_page.dart';
import 'package:bankinspace/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {

  AwesomeNotifications().initialize(
  'resource://drawable/res_notification_app_icon',
  [
    NotificationChannel(
    channelKey: 'basic_channel',
    channelName: 'Basic Notifications',
    defaultColor: Colors.teal,
    importance: NotificationImportance.High,
    channelShowBadge: true,
    
  )], );




  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'BankInSpace',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        initialBinding: SignUpBinding(),
        home: HomePage());
  }
}
