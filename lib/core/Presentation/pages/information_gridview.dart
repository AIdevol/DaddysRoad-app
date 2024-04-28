import 'package:daddysroad_clone/helper/constants/image.dart';
import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Informatiions extends StatefulWidget {
  const Informatiions({super.key});

  @override
  State<Informatiions> createState() => _MyInformatiions();
}

class _MyInformatiions extends State<Informatiions> {
  List<GridItem> gridItems = [
    GridItem(
        title: recharge,
        imagePath: fasttag,
        launchURL: 'https://fastagpro.com/recharge'),
    GridItem(
        title: checkrecharge,
        imagePath: tolltax,
        launchURL:
            'https://www.npci.org.in/what-we-do/netc-fastag/check-your-netc-fastag-status'),
    GridItem(
        title: challan,
        imagePath: trafficchallan,
        launchURL: 'https://echallan.parivahan.gov.in/'),
    GridItem(
        title: vdetails,
        imagePath: vehicledetails,
        launchURL:
            'https://vahan.parivahan.gov.in/nrservices/faces/user/citizen/citizenlogin.xhtml'),
    GridItem(
        title: licenseDetails,
        imagePath: licensePlate,
        launchURL: 'https://parivahan.gov.in/rcdlstatus/?pur_cd=101'),
    GridItem(
        title: Servicevahan,
        imagePath: note,
        launchURL:
            'https://parivahan.gov.in/parivahan//en/content/vehicle-related-services'),
    GridItem(
        title: puc,
        imagePath: carservice,
        launchURL: 'https://puc.parivahan.gov.in/puc/'),
    GridItem(
        title: VNumber,
        imagePath: licensePlate,
        launchURL:
            'https://fancy.parivahan.gov.in/fancy/faces/public/login.xhtml'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: gridItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return _buildGridItem(gridItems[index]);
        },
      ),
    );
  }

  Widget _buildGridItem(GridItem item) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      child: GestureDetector(
        onTap: () async {
          if (item.launchURL.isNotEmpty) {
            final uri = Uri.parse(item.launchURL);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Could not launch ${item.title}',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.red,
                ),
              );

              debugPrint('Could not launch ${item.launchURL}');
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(item.imagePath,
                    fit: BoxFit.contain), // Display the image
              ),
            ),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis, // Prevents text overflow
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class GridItem {
  final String title;
  final String imagePath;
  final String launchURL;

  GridItem(
      {required this.title, required this.imagePath, required this.launchURL});
}
