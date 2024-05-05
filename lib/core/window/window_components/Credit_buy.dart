
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditScreen extends StatefulWidget {
  const CreditScreen({super.key});

  @override
  State<CreditScreen> createState() => _CreditScreenState();
}

class _CreditScreenState extends State<CreditScreen> {
  final String _url = 'https://www.daddysroad.com/trcr.html'; // Example URL

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
        title: Text('Buy Credits'),
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
