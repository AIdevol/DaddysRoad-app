import 'package:daddysroad_clone/core/Presentation/notification/notification_screen.dart';
import 'package:daddysroad_clone/core/Presentation/pages/bottom_view.dart';
import 'package:daddysroad_clone/core/Presentation/pages/calucaltors.dart';
import 'package:daddysroad_clone/core/Presentation/pages/information_gridview.dart';
import 'package:daddysroad_clone/core/Presentation/pages/nearestVisit.dart';
import 'package:daddysroad_clone/core/Presentation/pages/premium.dart';
import 'package:daddysroad_clone/core/Presentation/pages/service_call_method_ui.dart';
import 'package:daddysroad_clone/core/window/drawer.dart';
import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDialOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WindowDrawer(),
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: const BottomViewPage(),
      floatingActionButton: _buildSpeedDial(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      flexibleSpace: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, size: 25, color: Colors.black),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  tooltip: 'Open menu',
                ),
              ),
              const Text(
                'DaddysRoad',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.notifications,
                    size: 25, color: Colors.black),
                onPressed: () => Get.to(const NotificationScreen()),
              ),
              IconButton(
                icon: const Icon(Icons.location_searching_outlined,
                    size: 25, color: Colors.black),
                onPressed: () => print("Location search button tapped!"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              ContainVariables(),
              SizedBox(height: 10),
              SectionHeader(title: info),
              Informatiions(),
              SizedBox(height: 10),
              SectionHeader(title: subsricptions),
              PremiumIsurance(),
              SizedBox(height: 10),
              SectionHeader(title: find),
              NearestStations(),
              SizedBox(height: 10),
              SectionHeader(title: calstring),
              Calculators(),
            ],
          ),
        ),
      ],
    );
  }

  SpeedDial _buildSpeedDial() {
    return SpeedDial(
      icon: _isDialOpen ? Icons.close : Icons.add,
      activeIcon: Icons.close,
      visible: true,
      curve: Curves.bounceIn,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => setState(() => _isDialOpen = true),
      onClose: () => setState(() => _isDialOpen = false),
      backgroundColor: Colors.amber,
      foregroundColor: Colors.black,
      elevation: 8.0,
      shape: CircleBorder(),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.phone),
          backgroundColor: Colors.green,
          label: 'Call Police',
          onTap: () => print('Calling Police...'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.local_hospital),
          backgroundColor: Colors.blue,
          label: 'Nearest Hospital',
          onTap: () => print('Navigating to nearest hospital...'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.fireplace),
          backgroundColor: Colors.orange,
          label: 'Fire Department',
          onTap: () => print('Calling Fire Department...'),
        ),
      ],
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Divider(
            thickness: 2.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
