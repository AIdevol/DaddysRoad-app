// import 'package:daddysroad_clone/helper/constants/image.dart';
// import 'package:flutter/material.dart';

// class BottomViewPage extends StatefulWidget {
//   const BottomViewPage({super.key});

//   @override
//   State<BottomViewPage> createState() => _BottomViewPage();
// }

// class _BottomViewPage extends State<BottomViewPage> {
//   int _selectedIndex = 0;

//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static final List<Widget> _widgetOptions = <Widget>[
//     const Text('Home Page', style: optionStyle),
//     Text('Messages', style: optionStyle),
//     Text('Profile', style: optionStyle),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       color: Colors.yellow,
//       child: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.fromLTRB(20, 10, 40, 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   height: 50,
//                   width: 70,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Image.asset(
//                       qrlogo,
//                       fit: BoxFit.contain,
//                     ),
//                     iconSize: 20,
//                   ),
//                 ),
//                 Container(
//                   height: 50,
//                   width: 70,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Image.asset(
//                       alerticon,
//                     ),
//                     iconSize: 20,
//                   ),
//                 ),
//                 Container(
//                   height: 50,
//                   width: 70,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Image.asset(
//                       resalecar,
//                     ),
//                     iconSize: 20,
//                   ),
//                 ),
//                 Container(
//                   height: 50,
//                   width: 70,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Image.asset(
//                       whatsappicon,
//                     ),
//                     iconSize: 20,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:daddysroad_clone/core/Presentation/additional_pages/QRscreen.dart';
import 'package:daddysroad_clone/helper/constants/image.dart';
import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomViewPage extends StatefulWidget {
  const BottomViewPage({super.key});

  @override
  State<BottomViewPage> createState() => _BottomViewPageState();
}

class _BottomViewPageState extends State<BottomViewPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Container(
        height: 50,
        width: 50,
        color: Colors.yellow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildIconButton(0, qrlogo, qr, OnTap: () {
              Get.to(Qrscreen());
            }),
            buildIconButton(1, alerticon, emergency,
                OnTap: () => _showEmergencyDialog(context)),
            buildIconButton(2, resalecar, carprice, OnTap: () {
              Get.to(Qrscreen());
            }),
            buildIconButton(3, whatsappicon, chatstring, OnTap: () {
              Get.to(Qrscreen());
            }),
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(int index, String assetName, String label,
      {required OnTap}) {
    return InkWell(
      onTap: OnTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              assetName,
              fit: BoxFit.contain,
              width: 30,
              height: 30,
            ),
          ),
          Text(label, style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }

  void _showEmergencyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          title: Text("Emergency Call"),
          content: const Text(
              "Would you like to call the emergency number now or open the dialer?"),
          actions: <Widget>[
            TextButton(
              child: Text("Call Now"),
              onPressed: () {
                Navigator.of(context).pop();
                _makePhoneCall(
                    'tel:100'); // Replace 112 with your emergency number
              },
            ),
            TextButton(
              child: Text("Open Dialer"),
              onPressed: () {
                Navigator.of(context).pop();
                _openDialer('112'); // Replace 112 with your emergency number
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _makePhoneCall(String url) async {
    const url = 'tel:100';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openDialer(String number) async {
    final url = 'tel:$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
