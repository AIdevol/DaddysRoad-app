import 'package:daddysroad_clone/helper/constants/image.dart';
import 'package:flutter/material.dart';

class ContainVariables extends StatelessWidget {
  const ContainVariables({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFeatureContainer(
                context, qrlogo, "Scan QR", () => onTapQR(context)),
            _buildFeatureContainer(context, carlicense, "My Vehicles",
                () => onTapVehicles(context)),
            _buildFeatureContainer(context, serviceCall, "Call Support",
                () => onTapSupport(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureContainer(
      BuildContext context, String imagePath, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 115,
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.red, width: 5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text(text,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

  void onTapQR(BuildContext context) {
    print('QR Scanner tapped...');
  }

  void onTapVehicles(BuildContext context) {
    print('My Vehicles tapped...');
  }

  void onTapSupport(BuildContext context) {
    print('Support tapped...');
  }
}
