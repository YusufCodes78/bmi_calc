// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:bmi_calc/main.dart';
import 'package:flutter/material.dart';
import 'widgets/rounded_button.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Container(
          width: double.infinity,

          color: Colors.indigo[200],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "BMI.",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
            ),
          ),
          RoundedButton(
            callback: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            title: 'BMI Calculator',
                          )));
            },
            btnText: "Start",
            bgColor: Colors.indigo,
            btnStyle: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ]),
        )
      ),
    );
  }
}
