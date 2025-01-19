
import 'package:calculator/View/Splash_Screen/Splash_Screen.dart';
import 'package:calculator/View_Model/Calculator_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()
      ),
    );
  }
}
