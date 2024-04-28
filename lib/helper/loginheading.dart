import 'package:flutter/material.dart';
import 'package:daddysroad_clone/helper/constants/image.dart'; // Assuming applogo is defined here

class AppHeading extends StatefulWidget {
  const AppHeading({super.key});

  @override
  State<AppHeading> createState() => _AppHeadingState();
}

class _AppHeadingState extends State<AppHeading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, 3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        height: 250,
        width: MediaQuery.of(context).size.width, // Set width to device's width
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.amber,
                height: 200,
                width: 200,
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  applogo,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                'Your Safety, Our Concern',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
