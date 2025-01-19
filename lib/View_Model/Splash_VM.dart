import 'package:flutter/material.dart';

class SplashViewModel {
  void navigateToNextScreen(BuildContext context, Widget nextScreen) {
    Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
    );
  }
}
