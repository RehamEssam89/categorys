import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // مكتبة SpinKit
import 'package:shop/mvvc/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // الانتقال تلقائيًا بعد 3 ثوانٍ
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/NTI_Logo.png',
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) {
                return const SpinKitChasingDots(
                  color: Colors.white,
                  size: 150.0,
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to NTI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
