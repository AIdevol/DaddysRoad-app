import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';

class MyVehicleScreen extends StatefulWidget {
  const MyVehicleScreen({Key? key}) : super(key: key);

  @override
  _MyVehicleScreenState createState() => _MyVehicleScreenState();
}

class _MyVehicleScreenState extends State<MyVehicleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0), // Start below the screen
      end: Offset.zero, // End at its original position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Vehicles",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.amber,
      ),
      body: _buildVehicleList(context),
    );
  }

  Widget _buildVehicleList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          SlideTransition(
            position: _offsetAnimation,
            child: _buildVehicleItem(
              title: "Hi Devesh Tiwari",
              subtitle: Infodetails,
              onTap: () {
                print('tapped');
              },
            ),
          ),
          SizedBox(height: 20),
          _buildButton(
            text: "Add New Vehicle",
            onTap: () {
              print('Add New Vehicle tapped');
            },
          ),
          SizedBox(height: 20),
          _buildButton(
            text: "Add New Tracker",
            onTap: () {
              print('Add New Tracker tapped');
            },
          ),
          SizedBox(height: 20),
          _buildButton(
            text: "Licence",
            onTap: () {
              print('Licence tapped');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleItem({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 5),
            color: Colors.white.withOpacity(0.5),
            blurRadius: 8.0,
          )
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                subtitle,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }
}
