import 'package:daddysroad_clone/auth/login/loginView.dart';
import 'package:daddysroad_clone/core/window/drawer.dart';
import 'package:daddysroad_clone/core/window/window_components/help_center.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawer Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Home Page")),
        body: Center(child: Text('Welcome to the home page!')),
        drawer: WindowDrawer(),
      ),
     
    );
  }
}
