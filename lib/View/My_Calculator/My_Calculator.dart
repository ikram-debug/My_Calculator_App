import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/View_Model/Calculator_View_Model.dart';

class My_Calculator extends StatefulWidget {
  const My_Calculator({super.key});

  @override
  State<My_Calculator> createState() => _My_CalculatorState();
}

class _My_CalculatorState extends State<My_Calculator> {
  Map<String, bool> buttonState = {};

  void handleTap(String text) {
    setState(() {
      buttonState[text] = true; // Set the button state to active
    });

    // Update the value in the provider
    Provider.of<CalculatorProvider>(context, listen: false).setValue(text);

    // Reset the button state after a delay
    Timer(const Duration(milliseconds: 350), () {
      setState(() {
        buttonState[text] = false;
      });
    });
  }

  bool buttonStates(String text) {
    return buttonState[text] ?? false; // Return false if the state is null
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        provider.displayText,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(Colors.grey[400]!, 'AC', Colors.black87),
                      numberSymbolButton(Colors.grey[400]!, '+/-', Colors.black87),
                      numberSymbolButton(Colors.grey[400]!, '%', Colors.black87),
                      numberSymbolButton(Colors.orange, '/', Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(Colors.white24, '7', Colors.white),
                      numberSymbolButton(Colors.white24, '8', Colors.white),
                      numberSymbolButton(Colors.white24, '9', Colors.white),
                      numberSymbolButton(Colors.orange, 'x', Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(Colors.white24, '4', Colors.white),
                      numberSymbolButton(Colors.white24, '5', Colors.white),
                      numberSymbolButton(Colors.white24, '6', Colors.white),
                      numberSymbolButton(Colors.orange, '-', Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberSymbolButton(Colors.white24, '1', Colors.white),
                      numberSymbolButton(Colors.white24, '2', Colors.white),
                      numberSymbolButton(Colors.white24, '3', Colors.white),
                      numberSymbolButton(Colors.orange, '+', Colors.white),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          handleTap('0');
                        },
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white24,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 60)
                        ),
                      ),
                      numberSymbolButton(Colors.white24, '.', Colors.white),
                      numberSymbolButton(Colors.white24, '=', Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget numberSymbolButton(Color bgColor, String text, Color textColor) {
    bool isActive = buttonStates(text); // Check the button's current state
    return GestureDetector(
      onTap: () => handleTap(text),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white38 : bgColor, // Change color if active
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,

              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
