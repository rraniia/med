import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meddose_app/firebase_options.dart';
import 'package:meddose_app/screens/Bilirubine_screen.dart';
import 'package:meddose_app/screens/Homepage_screen.dart';
import 'package:meddose_app/screens/Signup_screen.dart';
import 'package:meddose_app/screens/bsa_calculator.dart';
import 'package:meddose_app/screens/clairancerenal_calc.dart';
import 'package:meddose_app/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // ignore: unused_label
  options:
  DefaultFirebaseOptions.currentPlatform;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        'BSACalc': (context) => const BSACalc(),
        ' BilirubinCalculator': (context) => const BilirubinCalculator(),
        'ClairanceRenal': (context) => const ClairanceRenal(),
        'signupScreen': (context) => const SignUp(),
        'loginScreen': (context) => const LoginScreen(),
        'HomepageScreen': (context) => const Homepage(),
      },
    );
  }
}
