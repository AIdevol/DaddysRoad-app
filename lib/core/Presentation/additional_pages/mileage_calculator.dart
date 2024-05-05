import 'package:flutter/material.dart';

class MileagesCalculators extends StatefulWidget {
  const MileagesCalculators({super.key});

  @override
  State<MileagesCalculators> createState() => _MileagesCalculatorsState();
}

class _MileagesCalculatorsState extends State<MileagesCalculators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showMileageCalculatorDialog(context);
          },
          child: Text("Open Mileage Calculator"),
        ),
      ),
    );
  }

  void _showMileageCalculatorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: MileageCalculatorForm(),
          ),
        );
      },
    );
  }
}

class MileageCalculatorForm extends StatefulWidget {
  @override
  _MileageCalculatorFormState createState() => _MileageCalculatorFormState();
}

class _MileageCalculatorFormState extends State<MileageCalculatorForm> {
  final TextEditingController _controller = TextEditingController();
  double _mileageResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: _controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: "Enter distance in kilometers",
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _calculateMileage,
          child: Text("Calculate Mileage"),
        ),
        SizedBox(height: 20),
        Text(_mileageResult == 0.0
            ? "Enter value and press calculate"
            : "Mileage: $_mileageResult km/L"),
      ],
    );
  }

  void _calculateMileage() {
    final distance = double.tryParse(_controller.text);
    if (distance != null) {
      setState(() {
        // Assuming mileage rate of 0.35 km/L
        _mileageResult = distance * 0.35;
      });
    } else {
      setState(() {
        _mileageResult = 0.0; // Reset the result in case of invalid input
      });
    }
  }
}
