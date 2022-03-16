import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gsb_medecins/Screens/welcome_screen.dart';
import 'package:gsb_medecins/constants.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide demo banner
      debugShowCheckedModeBanner: false,
      title: 'GSB Médecins',
      home: WelcomeScreen(),
      // Setting up the custom themes created in theme.dart
      //
      // Default theme

    );
  }

}

//home: const nav(),