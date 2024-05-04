import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TgoTgpCalculator extends StatefulWidget {
  const TgoTgpCalculator({Key? key}) : super(key: key);

  @override
  _TgoTgpCalculatorState createState() => _TgoTgpCalculatorState();
}

class _TgoTgpCalculatorState extends State<TgoTgpCalculator> {
  TextEditingController tgoController = TextEditingController();
  TextEditingController tgpController = TextEditingController();
  String? resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'TGO / TGP Calculator',
          style: GoogleFonts.robotoSerif(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: tgoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter TGO value',
                      prefixIcon: Icon(Icons.arrow_circle_up),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: tgpController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter TGP value',
                      prefixIcon: Icon(Icons.arrow_circle_down),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    calculateTgoTgp();
                  },
                  icon: Icon(Icons.calculate),
                  label: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                ),
                SizedBox(width: 20),
                if (resultText != null)
                  Text(
                    'TGO/TGP: $resultText',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void calculateTgoTgp() {
    if (tgoController.text.isNotEmpty && tgpController.text.isNotEmpty) {
      double tgo = double.parse(tgoController.text);
      double tgp = double.parse(tgpController.text);
      double result = tgo / tgp;

      setState(() {
        resultText = result.toStringAsFixed(2);
      });
    } else {
      setState(() {
        resultText = 'Please enter values for TGO and TGP.';
      });
    }
  }
}
