import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanerPage extends StatefulWidget {
  @override
  _ScanerPageState createState() => _ScanerPageState();
}

class _ScanerPageState extends State<ScanerPage> {
  String qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image(
                image: NetworkImage(
                    "https://media.istockphoto.com/vectors/qr-code-scan-phone-icon-in-comic-style-scanner-in-smartphone-vector-vector-id1166145556")),
            flatButton("Scan QR CODE"),
            SizedBox(
              height: 20.0,
            ),
            // flatButton("Generate QR CODE", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        String codeSanner = await BarcodeScanner.scan(); //barcode scnner
        setState(() {
          qrCodeResult = codeSanner;
        });
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
