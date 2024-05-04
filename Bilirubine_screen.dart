import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BilirubinCalculator extends StatefulWidget {
  const BilirubinCalculator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BilirubinCalculatorState createState() => _BilirubinCalculatorState();
}

class _BilirubinCalculatorState extends State<BilirubinCalculator> {
  TextEditingController directController = TextEditingController();
  TextEditingController indirectController = TextEditingController();
  double? totalBilirubin;

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
          'Bilirubin Calculator',
          style: GoogleFonts.robotoSerif(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
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
                    controller: directController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Direct Bilirubin (mg/dL)',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: indirectController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Indirect Bilirubin (mg/dL)',
                    ),
                  ),
                  SizedBox(height: 20),
                  if (totalBilirubin != null)
                    Text(
                      'Total Bilirubin: ${totalBilirubin} mg/dL',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                calculateBilirubin();
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
          ],
        ),
      ),
    );
  }

  void calculateBilirubin() {
    if (directController.text.isNotEmpty &&
        indirectController.text.isNotEmpty) {
      double direct = double.parse(directController.text);
      double indirect = double.parse(indirectController.text);

      setState(() {
        totalBilirubin = direct + indirect;
      });
    } else {
      setState(() {
        totalBilirubin = null;
      });
    }
  }
}
