import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WindowDrawer extends StatelessWidget {
  const WindowDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(context),
          ..._createDrawerItems(context),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Version 3.11.13",
                style: theme.textTheme.caption,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.amber, // Using primary color from the theme
      child: const Padding(
        padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              size: 80,
            ),
            Text(
              "Devesh Tiwari",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              '6388802100',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _createDrawerItems(BuildContext context) {
    List<Map<String, dynamic>> drawerItems = [
      {
        'icon': Icons.group,
        'text': 'Groups',
        'onTap': () => Navigator.pushNamed(context, '/groups'),
      },
      {
        'icon': Icons.local_grocery_store_rounded,
        'text': 'Store',
        'onTap': () => Navigator.pushNamed(context, '/store'),
      },
      {
        'icon': Icons.credit_card,
        'text': 'Buy Credits',
        'onTap': () => Navigator.pushNamed(context, '/buyCredits'),
      },
      {
        'icon': Icons.settings,
        'text': 'Account Settings',
        'onTap': () => Navigator.pushNamed(context, '/accountSettings'),
      },
      {
        'icon': Icons.star_half_outlined,
        'text': 'Rate the app',
        'onTap': () => Navigator.pop(context),
      },
      {
        'icon': Icons.help,
        'text': 'Help Center',
        'onTap': () => Navigator.pushNamed(context, '/helpCenter'),
      },
      {
        'icon': Icons.logout,
        'text': 'Logout',
        'onTap': () => Get.offAllNamed('/login'),
      },
    ];

    return drawerItems.map((item) {
      return ListTile(
        leading: Icon(item['icon']),
        title: Text(item['text']),
        onTap: item['onTap'],
      );
    }).toList();
  }
}
