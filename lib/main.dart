// ignore_for_file: prefer_const_constructors

// import 'package:bmi_calc/intro_screen.dart';
import 'package:bmi_calc/splash_screen.dart';
// import 'package:bmi_calc/splash_screen.dart';
import 'package:bmi_calc/widgets/rounded_button.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var bgColor = Colors.indigo[200];
  var kgController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: bgColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "BMI.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: kgController,
                      decoration: InputDecoration(
                          label: Text("Weight(kg)"),
                          prefixIcon: Icon(Icons.line_weight)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: ftController,
                      decoration: InputDecoration(
                          label: Text("Height(ft)"),
                          prefixIcon: Icon(Icons.height)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: inController,
                      decoration: InputDecoration(
                          label: Text("Height(in)"),
                          prefixIcon: Icon(Icons.height)),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                    callback: () {
                      var wt = kgController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inController.text.toString();

                      if (wt != "" && ft != "" && inch != "") {
                        var weightInKg = int.parse(wt);
                        var heightInFeet = int.parse(ft);
                        var heightInInch = int.parse(inch);
                        heightInInch += heightInFeet * 12;
                        var heightInMetre = heightInInch * 0.0254;

                        var bmi = weightInKg / (heightInMetre * heightInMetre);
                        var msg;

                        if (bmi > 25) {
                          msg = "You are Overweight!!";
                          bgColor = Colors.amber[200];
                        } else if (bmi < 18) {
                          msg = "You are Underweight!!";
                          bgColor = Colors.red[200];
                        } else {
                          msg = "You are Healthy!!";
                          bgColor = Colors.green[200];
                        }
                        setState(() {
                          result = "Your BMI is ${bmi.toStringAsFixed(2)}\n$msg";
                        });
                      } else {
                        setState(() {
                          result = "Please fill all the details";
                        });
                      }
                    },
                    btnText: "Calculate",
                    bgColor: Colors.indigo,
                    btnStyle: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      result,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
