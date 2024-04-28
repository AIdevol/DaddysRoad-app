import 'package:flutter/material.dart';

class WindowDrawer extends StatelessWidget {
  const WindowDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _createHeader(context),
          ..._createDrawerItems(context),
          Divider(),
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

  _createHeader(BuildContext context) {
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
      },
      {'icon': Icons.local_grocery_store_rounded, 'text': 'Store'},
      {'icon': Icons.credit_card, 'text': 'Buy Credits'},
      {'icon': Icons.settings, 'text': 'Account Settings'},
      {'icon': Icons.star_half_outlined, 'text': 'Rate the app'},
      {'icon': Icons.help, 'text': 'Help Center'},
      {'icon': Icons.logout, 'text': 'Logout'},
    ];

    return drawerItems.map((item) {
      return ListTile(
        leading: Icon(item['icon']),
        title: Text(item['text']),
        onTap: () {
          Navigator.pop(context);
        },
      );
    }).toList();
  }
}
