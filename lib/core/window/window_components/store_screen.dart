import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final String _url =
      'https://daddysroad.ccavenue.com/stores/storefront.do?command=validateMerchant&param=daddysroad'; // Example URL

  Future<void> _launchUrl() async {
    Uri uri = Uri.parse(_url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Unable to launch URL, you can show an alert or a Snackbar here
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $_url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Store Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.open_in_browser),
            onPressed: _launchUrl,
            tooltip: 'Open Web Page',
          ),
        ],
      ),
      body: Center(
        child: Text(
            'Press the icon button in the top right corner to launch the URL.'),
      ),
    );
  }
}
