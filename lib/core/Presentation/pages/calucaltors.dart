import 'package:daddysroad_clone/core/Presentation/additional_pages/mileage_calculator.dart';
import 'package:daddysroad_clone/helper/constants/image.dart';
import 'package:daddysroad_clone/helper/constants/text_contants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calculators extends StatefulWidget {
  const Calculators({super.key});

  @override
  State<Calculators> createState() => _MyCalculators();
}

class _MyCalculators extends State<Calculators> {
  List<GridItem> gridItems = [
    GridItem(
        title: mileage,
        imagePath: mileageimg,
        onTap: () {
          Get.to(MileagesCalculators());
        }),
    GridItem(
        title: loan,
        imagePath: premiumcalculator,
        onTap: () => print('tappedd')),
    GridItem(
        title: gst, imagePath: calculators1, onTap: () => print('tappedd')),
    // GridItem(title: pshop, imagePath: punctureimg),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: gridItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildGridItem(gridItems[index]);
          },
        ),
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
        onTap: item.onTap,
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
  final VoidCallback onTap;

  GridItem({required this.title, required this.imagePath, required this.onTap});
}
