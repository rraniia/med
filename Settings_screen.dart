import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meddose_app/screens/login_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Main content here
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'MedDose',
                      style: GoogleFonts.pacifico(
                        fontSize: 40,
                        color: Colors.blue[900], // Deep blue color
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'MedDose is your comprehensive medical dosage calculator designed to simplify dosage calculations for healthcare professionals. Whether you\'re prescribing medications, adjusting dosages, or checking drug interactions, MedDose ensures accuracy and efficiency in your practice. With intuitive features and a user-friendly interface, MedDose is your trusted companion in medical care.\n\nIf you need assistance, please contact the admin.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[800]), // Dark gray color
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Logout button
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: Colors.redAccent,
              color: Colors.red[400],
              elevation: 7.0,
              child: InkWell(
                onTap: () {
                  // Navigate to login screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                borderRadius: BorderRadius.circular(30.0),
                child: Center(
                  child: Text(
                    "Log Out",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
