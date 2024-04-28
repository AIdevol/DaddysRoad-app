import 'package:daddysroad_clone/helper/constants/image.dart';
import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PremiumIsurance extends StatefulWidget {
  const PremiumIsurance({super.key});

  @override
  State<PremiumIsurance> createState() => _MyPremiumIsurance();
}

class _MyPremiumIsurance extends State<PremiumIsurance> {
  List<GridItem> gridItems = [
    GridItem(
        title: cinsuarance,
        imagePath: insurancecar,
        launchURL:
            'https://www.acko.com/gi/lp/new-car-comprehensive-hi?utm_source=google&utm_medium=cpc&utm_campaign=1st_Party_Generic_Search_Next16_Neev&utm_adgroup=Insurance_Rest_Phrase&utm_term=car%20insurance&utm_network=g&utm_matchtype=p&utm_device=c&utm_placement=&utm_content=618726622558&utm_Adposition=&utm_location=9301792&utm_Sitelink=&utm_Audience=kwd-10033531&utm_Promotion=&utm_Price=&gad_source=1&gclid=Cj0KCQjw_qexBhCoARIsAFgBlesZqDc1oq7L-mJKrL0Hnah7Pz4kJ2vSlyl3bk9-Rjy1yzrhfyBtv6gaAoCCEALw_wcB'),
    GridItem(
        title: binsurance,
        imagePath: bikeinsurance,
        launchURL:
            'https://www.acko.com/gi/lp/new-bike?utm_source=google&utm_medium=cpc&utm_campaign=First_Party_Bike_Generic_ROI_Quotes_GCID_Broad_C1&utm_adgroup=Generic_Bike&utm_term=bike%20insurance&utm_network=g&utm_matchtype=b&utm_device=c&utm_placement=&utm_content=673311985117&utm_Adposition=&utm_location=9301792&utm_Sitelink=&utm_Audience=kwd-17995050&utm_Promotion=&utm_Price=&gad_source=1&gclid=Cj0KCQjw_qexBhCoARIsAFgBlev64YmUMbA-tk1yd6qVLS1KTywqLRymhIp1zxI_2fWy0o3Pv6iWnVYaAmP-EALw_wcB'),
    GridItem(
        title: Pcalculator,
        imagePath: premiumcalculator,
        launchURL: 'https://www.acko.com/car-insurance/premium-calculator/'),
    GridItem(
        title: resale,
        imagePath: resalecar,
        launchURL: 'https://orangebookvalue.com/'),
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
          ;
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
