import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController heightControl = TextEditingController();

  TextEditingController massControl = TextEditingController();

  double conclusion = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.pink,
      title: Text(
          "Body Mass Index"
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(conclusion.toStringAsFixed(3),
              style: TextStyle(
                fontSize: 48
              ),
            ),

            SizedBox(height: 16),
            TextField(
              controller: heightControl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Height"),
                suffixText: "m",
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12
                ),
              ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: massControl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Mass"),
                suffixText: "kg",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
            child: Text("Calculate",
            style: TextStyle(
              fontSize: 24,
            ),
            ),
            onPressed: calculate,

            ),
          ],
        ),
      ),
    );
  }

  void calculate(){
    String heightText = heightControl.text.trim();
    String massText = massControl.text.trim();

    try {
      double height = double.parse(heightText);
      double mass = double.parse(massText);

      setState(() {
        conclusion = mass / (height * height);
      });

      // Display the body condition message
      String message = controlBody();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ));
    } catch (e) {
      print("There is an error: ${e.toString()}");
    }
  }

  String controlBody() {
    if (conclusion < 18) {
      return "You are skinny, take some kg";
    } else if (18 <= conclusion && conclusion < 24) {
      return "You have a perfect body";
    } else {
      return "You are obese";
    }
  }
}
