import 'package:flutter/material.dart';
import 'package:tokoonlinerani/addproduct.dart';
import 'package:tokoonlinerani/allproduct.dart';
import 'package:tokoonlinerani/homepage.dart';
import 'package:tokoonlinerani/allproduct.dart';
import 'package:tokoonlinerani/productitems.dart';
import 'package:tokoonlinerani/splashscreen.dart';
import 'package:tokoonlinerani/allproduct.dart';
import 'package:tokoonlinerani/addproduct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const homePage(),
    );
  }
}