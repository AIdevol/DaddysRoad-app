import 'package:daddysroad_clone/auth/login/loginView.dart';
import 'package:daddysroad_clone/core/window/window_components/Credit_buy.dart';
import 'package:daddysroad_clone/core/window/window_components/groups.dart';
import 'package:daddysroad_clone/core/window/window_components/help_center.dart';
import 'package:daddysroad_clone/core/window/window_components/store_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        '/groups': (context) => GroupSection(),
        '/store': (context) => StoreScreen(),
        '/buyCredits': (context) => CreditScreen(),
        // '/accountSettings': (context) => AccountSettingsScreen(),
        // '/rateApp': (context) => RateAppScreen(),
        '/helpCenter': (context) => HelpCenter(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
