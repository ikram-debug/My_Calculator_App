import 'package:calculator/View/My_Calculator/My_Calculator.dart';
import 'package:calculator/View_Model/Splash_VM.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// I Am Ikram

class _SplashScreenState extends State<SplashScreen> {
  final SplashViewModel _viewModel = SplashViewModel();
  @override
  void initState() {
    super.initState();
    _viewModel.navigateToNextScreen(context, My_Calculator());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset('assets/download-removebg-preview.png'),
            ),
            SizedBox(height: 10),
            Text(
              'My Calculator',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

