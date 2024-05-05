import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Help',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildHelpCenterItems(),
    );
  }

  Widget _buildHelpCenterItems() {
    List<Map<String, dynamic>> helpCenterItems = [
      {
        'text': 'Terms and Conditions',
        'icon': Icons.arrow_forward_rounded,
        'onTap': () => _handleItemTap('Terms and Conditions')
      },
      {
        'text': 'Stores',
        'icon': Icons.arrow_forward_rounded,
        'onTap': () => _handleItemTap('Contact Us')
      },
      {
        'text': 'Privacy Policy',
        'icon': Icons.arrow_forward_rounded,
        'onTap': () => _handleItemTap('Privacy Policy')
      },
      {
        'text': 'FAQ',
        'icon': Icons.arrow_forward_rounded,
        'onTap': () => _handleItemTap('FAQ')
      },
      {
        'text': 'Disclaimer',
        'icon': Icons.arrow_forward_rounded,
        'onTap': () => _handleItemTap('About Us')
      },
      {
        'text': 'Copyright',
        'icon': Icons.arrow_forward_rounded,
        'onTap': () => _handleItemTap('About Us')
      }
    ];

    return ListView.builder(
      itemCount: helpCenterItems.length,
      itemBuilder: (context, index) {
        final item = helpCenterItems[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: Colors
                            .grey.shade300) // Customizable color and width
                    )),
            child: ListTile(
              title: Text(item['text']),
              trailing: IconButton(
                icon: Icon(item['icon'], color: Colors.black),
                onPressed: item['onTap'],
              ),
              onTap: item['onTap'],
            ),
          ),
        );
      },
    );
  }

  void _handleItemTap(String itemName) {
    // Handle navigation or show a dialog based on the item name
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(itemName),
        content: Text("You tapped on $itemName."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
