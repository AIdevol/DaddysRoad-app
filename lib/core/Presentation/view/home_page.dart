import 'package:daddysroad_clone/core/Presentation/pages/calucaltors.dart';
import 'package:daddysroad_clone/core/Presentation/pages/information_gridview.dart';
import 'package:daddysroad_clone/core/Presentation/pages/nearestVisit.dart';
import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';
import 'package:daddysroad_clone/core/Presentation/pages/bottom_view.dart';

import 'package:daddysroad_clone/core/Presentation/pages/premium.dart';
import 'package:daddysroad_clone/core/window/drawer.dart';
// import 'package:daddysroad_clone/helper/constants/text_constants.dart';

import '../pages/service_call_method_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const WindowDrawer(),
      appBar: _buildAppBar(context),
      body: _buildBody(),
      bottomNavigationBar: const BottomViewPage(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          color: Colors.amber,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Builder(
                // Adding Builder here
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, size: 25, color: Colors.black),
                  onPressed: () => Scaffold.of(context)
                      .openDrawer(), // Now it uses the Builder's context
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
                onPressed: () => print("Notifications button tapped!"),
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
