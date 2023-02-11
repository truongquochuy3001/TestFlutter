import 'package:flutter/material.dart';
import 'package:flutter_application_1/uis/chat_screen.dart';
import 'package:flutter_application_1/uis/discover_screen.dart';
import 'package:flutter_application_1/uis/food_delivery.dart';
import 'package:flutter_application_1/uis/login.dart';
import 'package:flutter_application_1/uis/register.dart';
import 'package:flutter_application_1/uis/register_2.dart';
import 'package:flutter_application_1/uis/search_screen.dart';
import 'dart:ui';

import 'package:flutter_application_1/uis/splash_screen.dart';

import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
