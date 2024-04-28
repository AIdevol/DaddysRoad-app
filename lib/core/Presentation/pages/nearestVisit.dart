import 'package:daddysroad_clone/helper/constants/image.dart';
import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';

class NearestStations extends StatefulWidget {
  const NearestStations({super.key});

  @override
  State<NearestStations> createState() => _MyNearestStations();
}

class _MyNearestStations extends State<NearestStations> {
  List<GridItem> gridItems = [
    GridItem(title: Petrolpmp, imagePath: petrlpmp),
    GridItem(title: pstation, imagePath: policstation),
    GridItem(title: hospitl, imagePath: hospital),
    GridItem(title: pshop, imagePath: punctureimg),
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
        onTap: () => print('${item.title} tapped...'),
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

  GridItem({required this.title, required this.imagePath});
}
