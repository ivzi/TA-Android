import 'package:flutter/material.dart';
import 'package:happy_sales/splashscreen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Happy Sales',
        theme: new ThemeData(primarySwatch: Colors.red),
        home: SplashScreenPage(),
      ),
    );
