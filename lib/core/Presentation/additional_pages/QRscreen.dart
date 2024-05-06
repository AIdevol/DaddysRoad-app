import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:torch_light/torch_light.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart'
    as mlkit;

class Qrscreen extends StatefulWidget {
  const Qrscreen({super.key});

  @override
  State<Qrscreen> createState() => _QrscreenState();
}

class _QrscreenState extends State<Qrscreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isTorchOn = false;
  final mlkit.BarcodeScanner barcodeScanner =
      mlkit.BarcodeScanner(formats: [mlkit.BarcodeFormat.qrCode]);

  @override
  void dispose() {
    controller?.dispose();
    barcodeScanner.close(); // Ensure barcode scanner is closed properly
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      _showDialog(scanData.code);
    });
  }

  Future<void> _toggleFlash() async {
    try {
      if (isTorchOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      setState(() {
        isTorchOn = !isTorchOn;
      });
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _scanFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final inputImage = mlkit.InputImage.fromFilePath(pickedFile.path);
      final List<mlkit.Barcode> barcodes =
          await barcodeScanner.processImage(inputImage);

      if (barcodes.isNotEmpty) {
        // Directly access the displayValue
        String? scannedData =
            barcodes.first.displayValue; // Access displayValue directly
        _showDialog(scannedData);
      } else {
        _showError('No QR code detected.');
      }
    }
  }

  void _showDialog(String? text) {
    // Provide a default message if null
    String message = text ?? 'No data available';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("QR Code Result"),
        content: Text("Data: $message"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              controller?.resumeCamera();
            },
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text(
            'QR Scanner',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.red,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: _scanFromGallery,
                    icon: const Icon(Icons.photo_library),
                    label: const Text("Scan from Gallery"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Colors.white70,
                      // minimumSize: Size(300, 50),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: _toggleFlash,
                    icon: Icon(isTorchOn ? Icons.flash_off : Icons.flash_on),
                    label: Text(isTorchOn ? "Flash Off" : "Flash On"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: Colors.white70,
                      // minimumSize: Size(300, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
