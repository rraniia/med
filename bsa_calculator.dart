import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BSACalc extends StatefulWidget {
  const BSACalc({Key? key}) : super(key: key);

  @override
  _BSACalcState createState() => _BSACalcState();
}

class _BSACalcState extends State<BSACalc> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bodySurfaceArea = 0;

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
          'Body Surface Area',
          style: GoogleFonts.robotoSerif(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: 'Height (cm)',
                      labelStyle: TextStyle(color: Colors.grey[800]),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: 'Weight (kg)',
                      labelStyle: TextStyle(color: Colors.grey[800]),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                double height = double.tryParse(heightController.text) ?? 0;
                double weight = double.tryParse(weightController.text) ?? 0;

                setState(() {
                  bodySurfaceArea = calculateBodySurfaceArea(height, weight);
                });
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[200],
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              icon: Icon(Icons.calculate_rounded, size: 30),
              label: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Body Surface Area: ${bodySurfaceArea.toStringAsFixed(2)} m²',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateBodySurfaceArea(double height, double weight) {
    if (height <= 0 || weight <= 0) {
      return 0;
    }

    // Body Surface Area calculation (Du Bois formula)
    double bodySurfaceArea = 0.007184 * pow(height, 0.725) * pow(weight, 0.425);
    return bodySurfaceArea;
  }
}
