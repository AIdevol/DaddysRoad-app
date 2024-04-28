import 'package:flutter/material.dart';

class MileagesCalculators extends StatefulWidget {
  const MileagesCalculators({super.key});

  @override
  State<MileagesCalculators> createState() => _MileagesCalculatorsState();
}

class _MileagesCalculatorsState extends State<MileagesCalculators> {
  double _distance = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('Calculate Mileage'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Mileage Calculator'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Distance (in km)',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _distance = double.parse(value);
                        });
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Calculate'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      double _mileage = 100 / _distance;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Mileage Result'),
                            content: Text('Your mileage is ${_mileage.toStringAsFixed(2)} km/l'),
                          );
                        },
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}